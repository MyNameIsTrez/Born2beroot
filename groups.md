# Add user
`sudo adduser sbos`
`sudo useradd sbos` and then `sudo passwd sbos`

# Add group
`sudo addgroup foo`
`sudo groupadd foo`

# Add user to group
`sudo adduser sbos foo`
`sudo gpasswd --add sbos foo`

# Remove user from group
`sudo deluser sbos foo`
`sudo gpasswd --delete sbos foo`

# Remove group
`sudo delgroup foo`
`sudo groupdel foo`

# List user groups
`groups sbos`

# List all groups
`getent group | cut -d: -f1`

# List users
`cat /etc/passwd | cut -d: -f1`

# Change user password
`sudo passwd sbos`
