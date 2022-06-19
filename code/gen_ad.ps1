param([Parameter(Mandatory=$true)] $JSONFile)

#create a user
function CreateUser()
{
    #Pull user and password from file
    param([Parameter(Mandatory=$true)] $userObject)
    $name =$userObject.name
    $password=$userObject.password

    #create username from name
    $firstname, $lastname= $name.split(" ")
    $username = ($firstname[0] + $lastname).ToLower()
    $samAccountName = $username
    $principalname = $username
    
    #Create User in Active Directory
    #Only adds new user if it doesn't exist already
    try{
        Get-ADUser -Identity $username
        echo "user" $username "already exists"
    }
    catch [Microsoft.ActiveDirectory.Management.ADIDentityNotFoundException]{
        New-ADUser -Name "$name" -GivenName "$firstname" -SurName "$lastname" -SamAccountName "$samAccountName" -UserPrincipalName "$principalname@$Global:DomainName" -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -PassThru | Enable-ADAccount
        echo "User Added"
        Get-ADUser -Identity $username
    }
        

    #Add user to groups
    foreach($group in $userObject.groups){
        #Check if group exists before you add user to group
        try{
            Get-ADGroup -Identity $group
            Add-ADGroupMember -Identity $group -Members $username
        }
        catch [Microsoft.ActiveDirectory.Management.ADIDentityNotFoundException]{
            Write-Warning "Group" $group "not found, user wasn't added to group"
        }
       
    }
}
#create new group
function CreateADGroup(){
    param([Parameter(Mandatory=$true)] $groupObject)
    
    $name = $groupObject.group_name
    
    foreach($group in $userObject.groups){
        #Adds new group only if it doesn't exist
        try{
            Get-ADGroup -Identity $group
            echo "group" $name "already exists"
        }

        catch [Microsoft.ActiveDirectory.Management.ADIDentityNotFoundException]{
            new-ADGroup -name $name -GroupScope Global
            echo "Group Added"
        }
    }


}

$json = ( Get-Content $JSONFile | ConvertFrom-JSON)

$Global:DomainName= $json.domain

foreach ($group in $json.groups){
    CreateADGroup $group
   
}
foreach ($user in $json.users){
    CreateUser $user
}

