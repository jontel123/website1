# Install Active Directory Domain Services role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Install DNS Server role
Install-WindowsFeature -Name DNS -IncludeManagementTools

# Promote server to domain controller and configure DNS
$adminPassword = ConvertTo-SecureString "qwer4321!" -AsPlainText -Force
$domainAdminCreds = New-Object System.Management.Automation.PSCredential ("roee", $adminPassword)

Install-ADDSForest `
    -DomainName "Kernel.com" `
    -SafeModeAdministratorPassword $domainAdminCreds.Password `
    -Force:$true `
    -NoDnsOnNetwork:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -LogPath "C:\Windows\NTDS" `
    -SysvolPath "C:\Windows\SYSVOL"

# Restart the server
Restart-Computer -Force
