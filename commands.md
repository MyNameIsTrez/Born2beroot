## Simple setup

### Check UFW status
`sudo ufw status verbose`/`sudo systemctl status ufw`

### Check SSH status
`ssh -p 4242 sbos@127.0.0.1`

### Check OS is Debian
`uname -a`


## User

### Check sbos is in sudo and user42 groups
`groups sbos`

### Create user
`sudo adduser <user>`

### Show password policy

#### Password requirements
`sudo nano /etc/pam.d/common-password`

#### Show PASS_WARN_AGE etc.
`sudo nano /etc/login.defs`

### Create evaluating group
`sudo addgroup evaluating`

### Assign user to group
`sudo adduser <user> evaluating`

### Check user belongs to evaluating group
`groups <user>`


## Hostname and partitions

### Show hostname
`hostname`

### Modify hostname
`sudo nano /etc/hostname` and `sudo nano /etc/hosts` to use `<user42>`

### View partitions
`lsblk`


## Sudo

### Add user to sudo group
`sudo gpasswd --add <user> sudo`

### Show sudo policy
`sudo visudo` (`sudo cat /etc/sudoers`)


## UFW

### List rules
`sudo ufw status verbose`

### Allow and disallow port 8080
`sudo ufw allow 8080` and `sudo ufw delete allow 8080`


## SSH

### Verify port 4242
`sudo nano /etc/ssh/sshd_config`


## monitoring.sh

### Show script
- `sudo nano /root/monitoring.sh`

### Show cron
- `sudo crontab -e`

### Stop monitoring.sh
Comment out rule in cron file
