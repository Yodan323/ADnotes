# ADnotes
Active Directory lab notes

# Clone from GitHub
git clone https://github.com/Yodan323/ADnotes.git

# Add Address to computer trusted hosts
PS: set-item wsman:\localhost\Client\Trustedhosts -value *ip address*

# Start Remote Session
PS: $dc = New-PSSession -ComputerName *ip address* -Credential(Get-Credential)
$dc- Variable containing new session
PS: Enter-PSSession [SESSION_ID]

# Copy file to session
Copy-Item *file directory* -ToSession $dc C:\Windows\Tasks

# Add new Computer to Git to ssh connections
1. generate ssh key with PS: ssh-keygen -t ed25519 -C "yodan323@gmail.com"
2. Add key to ssh agent with PS: ssh-add .\.ssh\ [KEY_NAME]
3. Add key to GitHub account.
4. Clone repository with git clone git@github.com:Yodan323/ADnotes.git

# Convert JSON file to powershell
PS: Get-Content *file directory* |ConvertFrom-Json

# IP Addresses
Domain Controller: 192.168.160.128
Default Gateway: 192.168.160.2