- [x] Download Debian in Downloads.
- [x] Set up Debian VirtualBox VM in /sgoinfre/sbos/VirtualBox
- Port forwarded VM in VirtualBox under Network settings.
- `scp -P 4242 sbos@127.0.0.1:/etc/ssh/sshd_config ~/Documents/Programming/Born2beroot/backups`
- `systemctl restart sshd`
- `sudo ufw enable`


# Overview
- [x] An SSH service will be running on port 4242 only. For security reasons, it must not be possible to connect using SSH as root.
  - `sudo nano /etc/ssh/sshd_config` and set `PermitRootLogin` to `no`.
  - `sudo service ssh restart` and reconnect SSH.
- [x] You have to configure your operating system with the UFW firewall and thus leave only port 4242 open.
- [x] The hostname of your virtual machine must be your login ending with 42 (e.g., wil42). You will have to modify this hostname during your evaluation.
- [x] You have to implement a strong password policy.
- [x] You have to install and configure sudo following strict rules.
- [x] In addition to the root user, a user with your login as username has to be present.
- [x] This user has to belong to the user42 and sudo groups.
- [x] `monitoring.sh`


## Password policy
`sudo apt install libpam-cracklib`
- [x] Your password has to expire every 30 days.
- [x] The minimum number of days allowed before the modification of a password will be set to 2.
- [x] The user has to receive a warning message 7 days before their password expires.
- [x] Your password must be at least 10 characters long. It must contain an uppercase letter and a number. Also, it must not contain more than 3 consecutive identical characters.
- [x] The password must not include the name of the user.
- [x] Of course, your root password has to comply with this policy.
- [x] The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password.


## Sudo policy
- [x] Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
- [x] A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.
- [x] Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the `/var/log/sudo/` folder.
- [x] The TTY mode has to be enabled for security reasons.
- [x] For security reasons too, the paths that can be used by sudo must be restricted. Example: `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`.


## Bash monitoring.sh
At server startup, the script will display some information (listed below) on all terminals every 10 minutes (take a look at wall). The banner is optional. No error must be visible.

See the [crontab](https://man7.org/linux/man-pages/man5/crontab.5.html) documentation.
- `sudo crontab -e`
- `sudo chmod u+x /root/monitoring.sh`
- `sudo nano /root/monitoring.sh`

Your script must always be able to display the following information:
- [x] The architecture of your operating system and its kernel version.
- [x] The number of physical processors.
- [x] The number of virtual processors.
- [x] The current available RAM on your server and its utilization rate as a percentage.
- [x] The current available memory on your server and its utilization rate as a percentage.
- [x] The current utilization rate of your processors as a percentage.
- [x] The date and time of the last reboot.
- [x] Whether LVM is active or not.
- [x] The number of active connections.
- [x] The number of users using the server.
- [x] The IPv4 address of your server and its MAC (Media Access Control) address.
- [x] The number of commands executed with the sudo program.
