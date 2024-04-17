# Step 1: Install Active Directory Domain Services feature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Step 2: Promote the server to a domain controller and create a new forest
Install-ADDSForest `
    -DomainName "kernel.com" `
    -DomainNetbiosName "KERNEL" `
    -ForestMode Win2016 `
    -DomainMode Win2016 `
    -InstallDns `
    -NoRebootOnCompletion

# Step 3: Reboot the server to complete the Active Directory installation
Restart-Computer -Force
