# Cygwin 64-bit Installation 

## 1. Download the cygwin 64-bit Setup Installer
Invoke-WebRequest -Uri https://www.cygwin.com/setup-x86_64.exe -OutFile setup-x86_64.exe

## 2. Run the setup installer
## **Note**: Typically you should run the installer **excluding** the file extension - i.e setup-x86_64 --help. 
## To run the setup installer **excluding** the file extension, you should add it to the %PATH% environment variable, or move it to a location already on the %PATH%.
setup-x86_64.exe --help
setup-x86_64 --help

## 3. Run the setup installer for package installation
setup-x86_64.exe -qnNdO -R C:\cygwin64 -s https://cygwin.mirror.constant.com -l C:\cygwin64\var\cache\setup -P [package-name] -P [package-name] ... [other-packages-as-needed]

## 4. Add the cygwin bin directory to PATH
# Using Command Prompt
set PATH=%SYSTEMDRIVE%\cygwin64\bin;%PATH%

# Using PowerShell
[System.Environment]::SetEnvironmentVariable('path', $env:SYSTEMDRIVE + "\cygwin64\bin;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User") 

## Repeat step 3. as needed to update/install packages 
