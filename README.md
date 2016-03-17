# insp3ct
Identify intruders change files in git projects

**Note:** The project to inspect require git.

When a hacker violates a wordpress website (for example) raises shell for better control files and thus make a deface.

That's why it's a good idea to identify modified or created file to the hacker.

![Example](https://raw.githubusercontent.com/paulomcnally/insp3ct/master/assets/mobile.gif)

## Install

    $ wget https://github.com/paulomcnally/insp3ct/raw/master/insp3ct_1.0_all.deb
    $ sudo dpkg -i insp3ct_1.0_all.deb

## Configuration

    $ sudo vi /etc/default/insp3ct.cfg

## Crontab example

    $ crontab -e

    # every 5 minutes
    */5 * * * * /usr/bin/insp3ct /var/www/html/wordpress

To get a key from mailgun visit: https://mailgun.com/signup
