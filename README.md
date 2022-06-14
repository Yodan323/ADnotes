# ADnotes
Active Directory lab notes
# Clone from GitHub
git clone git@github.com:Yodan323/ADnotes.git
# Add Address to computer trusted hosts
set-item wsman:\localhost\Client\Trustedhosts -value [IP ADDRESS]
# Start Remote Session
New-PSSession -ComputerName 192.168.160.128 -Credential(Get-Credential())




# IP Addresses
Domain Controller: 192.168.160.128
Default Gateway: 192.168.160.2