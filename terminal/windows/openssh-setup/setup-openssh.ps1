# Script to install and setup OpenSSH for Windows

# Run $PSVersionTable.PSVersion to verify major version is at least 5,
# and minor version is at least 1.
$version = $PSVersionTable.PSVersion
if ([int]$version.Major -lt 5 -and [int]$version.Minor -lt 1) {
   Write-Host "PowerShell minimum version 5.1 is required" -Foreground Red
   Write-Host " Vist: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows" -Foreground Red
} else {
   Write-Host "Setting up OpenSSH" -Foreground Blue
}

$isAdminMember = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-Not $isAdminMember) {
   Write-Host "Elevated session is required to continue." -Foreground Red
}
$gsudoIsInstalled = Invoke-Command {winget search --name gsudo}
if (-Not $gsudoIsIntalled -and -Not $isAdminMember) {
    Write-Host "Elevated session is required" ;
} else {
    $sshIsInstalled = gsudo {Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'}
}
if (-Not ($sshIsInstalled.State[0].Value -eq "Installed" -and $sshIsInstalled.State[1].Value -eq "Installed")) {
   Write-Host "Please check that both OpenSSH.Client and OpenSSH.Server are installed." -Foreground Red
}
if (-Not $sshIsInstalled.State[0].Value -eq "Installed") {
   Write-Host "Install the OpenSSH.Client:"
   Write-Host "Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0"
}
if (-Not $sshIsInstalled.State[1].Value -eq "Installed") {
   Write-Host "Install the OpenSSH.Server:"
   Write-Host "Add-WindowsCapablity -Online -Name OpenSSH.Server~~~~0.0.1.0"
}

Write-Host "1. Start the sshd service"
Write-Host "Start-Service sshd"
Write-Host "2. OPTIONAL but recommended:"
Write-Host "Set-Service -Name sshd -StartupType 'Automatic'"
Write-Host "3. Confirm the Firewall rule is configured. It should be created automatically by setup."
Write-Host "   Run the following to verify:"
Write-Host "if (!(Get-NetFirewallRule -Name `"OpenSSH-Server-In-TCP`" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {"
Write-Host "    Write-Output `"Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it...`""
Write-Host "    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22"
Write-Host "} else {"
Write-Host "    Write-Output `"Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists.`""
Write-Host "}"
Write-Host "4. Visit the following link to configure ssh key pairs for authentication in OpenSSH key management:"
Write-Host "https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement"
Write-Host "Tip: When running OpenSSH executables, use full Windows path to the executable to ensure running the correct ssh client"
exit
