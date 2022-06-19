# ADnotes
Active Directory lab notes

# Clone from GitHub
git clone https://github.com/Yodan323/ADnotes.git

# Add Address to computer trusted hosts
set-item wsman:\localhost\Client\Trustedhosts -value [IP ADDRESS]

# Start Remote Session
New-PSSession -ComputerName 192.168.160.128 -Credential(Get-Credential)
Enter-PSSession 1

# Add new Computer to Git to ssh connections
1. generate ssh key with ssh-keygen -t ed25519 -C "yodan323@gmail.com"
2. Add key to ssh agent with: ssh-add .\.ssh\KEY_NAME
3. Add key to GitHub account.
4. Clone repository with git clone git@github.com:Yodan323/ADnotes.git

# IP Addresses
Domain Controller: 192.168.160.128
Default Gateway: 192.168.160.2