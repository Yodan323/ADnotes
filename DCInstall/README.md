# How to Install DC
1. Install windows server on VM
2. Install VMTools
3. Change IP to Static
4. Change Hostname
5. Change DNS server to DC ip address
6. Install AD Domain Services using PS Command *install-windowsfeature AD-Domain-Services -IncludemanagementTools*
7. Import AD using *import-Module ADDSDeployment*
 				   *install-ADDSForest*
8. Configure domain name and safe mode password

# How to add computers to domain
1. Go to "this pc"-> "properties"-> "rename this PC"-> "change domain or workgroup"
2. Enter domain name and domain administrator user
