#!/bin/bash
# Insp3ct. Copyright (c) 2016, Paulo McNally
# Version 1.0

# show red text
error_message () {
  esc=`echo "\033"`
  cc_red="${esc}[0;31m"
  cc_default=`echo "${esc}[m\017"`
  echo "${cc_red}$1${cc_default}"
}

# send email
send_mail () {
  #path based pwd
  path="$1"
  status="$2"

  # ip address
  host=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`

  # send email with curl
  curl -s --user "api:$MAILGUN_KEY" \
  "$MAILGUN_API_URL/messages" \
  -F from="$INSPECT_EMAIL_FROM" \
  -F to="$INSPECT_EMAIL_TO" \
  -F subject="$INSPECT_EMAIL_SUBJECT" \
  -F text="Path: ${path}\nHost: ${host}\nFiles affected: ${status}" \
  -F html="Path: ${path} <br/>Host: ${host} <br/>Files affected: ${status}"
}

# git exists
check () {
  program="$1"
  condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)
  if [ $condition -eq 0 ] ; then
    error_message "$program is required!"
    exit 0
  fi

  if [ -z "$MAILGUN_KEY" ]; then
     echo "Set environment var MAILGUN_KEY";
     exit 0
  fi
  if [ -z "$MAILGUN_API_URL" ]; then
    echo "Set environment var MAILGUN_API_URL";
    exit 0
  fi
  if [ -z "$INSPECT_EMAIL_FROM" ]; then
    echo "Set environment var INSPECT_EMAIL_FROM";
    exit 0
  fi
  if [ -z "$INSPECT_EMAIL_TO" ]; then
    echo "Set environment var INSPECT_EMAIL_TO";
    exit 0
  fi
  if [ -z "$INSPECT_EMAIL_SUBJECT" ]; then
    echo "Set environment var INSPECT_EMAIL_SUBJECT";
    exit 0
  fi

}

# check requirements
check git
check curl

if [ "$#" -eq  "0" ]
  then
  error_message "Project path is required!"
else
  cd $1
  if git status --porcelain>/dev/null; then
    send_mail `pwd` `git status --porcelain 2>/dev/null| grep "^??" | awk '{print $2}' | tr '\n' ','`
  fi
fi
