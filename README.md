# inspect
Identify intruders change files in git projects

## Environments

    MAILGUN_KEY // key-123456789123456789123456789
    MAILGUN_API_URL // https://api.mailgun.net/v3/sandbox82516.mailgun.org
    INSPECT_EMAIL_FROM // Insp3ct <insp3ct@security.org>
    INSPECT_EMAIL_TO // youre@email.com
    INSPECT_EMAIL_SUBJECT // Changes were identified in files

## Example

    $ sh ./inspect.sh /my/git/project

To get a key from mailgun visit: https://mailgun.com/signup
