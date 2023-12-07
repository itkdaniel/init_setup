# PowerShell script to install gsudo.
# gsudo is the Windows equivalent to Unix sudo command.
# https://github.com/gerardog/gsudo/blob/master/installgsudo.ps1
# The script is also saved locally as: install-gsudo-script.ps1

$isInstalled = Invoke-Command {winget search --id gerardog.gsudo}

if($isInstalled.Name -eq 'gsudo') {
   Write-Host "Package 'gsudo' already installed"
} else {
   Write-Host "Installing package: gsudo"
   Invoke-Command {winget install --id gerardog.gsudo}
}

# Install using PowerShell Invoke-WebRequest
Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex

# Install Outside of PowerShell
#PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"

# PowerShell users: To use enhanced gsudo and Invoke-Gsudo cmdlet, add the following line to your $PROFILE
#   Import-Module 'gsudoModule'
# Or run:
#   Write-Output "`nImport-Module 'gsudoModule'" | Add-Content $PROFILE
# Add import gsudo module command to a powershell profile.
Write-Output "`nImport-Module 'gsudoModule'" | Add-Content $PROFILE
