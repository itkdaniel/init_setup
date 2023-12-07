## PowerShellGallery - Cygwin Installation Script
## https://www.powershellgallery.com/packages/AppVeyorBYOC/1.0.21/Content/scripts%5CWindows%5Cinstall_cygwin.ps1

## 32-bit Installation
Write-Host "Installing Cygwin x86..." -ForegroundColor Cyan

if(Test-Path C:\cygwin) {
    Write-Host "Deleting existing installation..."
    Remove-Item C:\cygwin -Recurse -Force
}

# download installer
New-Item -Path C:\cygwin -ItemType Directory -Force
$exePath = "C:\cygwin\setup-x86.exe"
(New-Object Net.WebClient).DownloadFile('https://cygwin.com/setup-x86.exe', $exePath)

# install cygwin
cmd /c start /wait $exePath -qnNdO -R C:/cygwin -s http://cygwin.mirror.constant.com -l C:/cygwin/var/cache/setup -P mingw64-i686-gcc-g++ -P mingw64-x86_64-gcc-g++ -P gcc-g++ -P autoconf -P automake -P bison -P libtool -P make -P python -P gettext-devel -P intltool -P libiconv -P pkg-config -P wget -P curl
C:\Cygwin\bin\bash -lc true

# C:\cygwin\bin\gcc --version

Write-Host "Installed Cygwin x86" -ForegroundColor Green

#############################################################

## 64-bit Installation
Write-Host "Installing Cygwin x64..." -ForegroundColor Cyan

if(Test-Path C:\cygwin64) {
    Write-Host "Deleting existing installation..."
    Remove-Item C:\cygwin64 -Recurse -Force
}

# download installer
New-Item -Path C:\cygwin64 -ItemType Directory -Force
$exePath = "C:\cygwin64\setup-x86_64.exe"
(New-Object Net.WebClient).DownloadFile('https://cygwin.com/setup-x86_64.exe', $exePath)

# install cygwin
cmd /c start /wait $exePath -qnNdO -R C:/cygwin64 -s http://cygwin.mirror.constant.com -l C:/cygwin64/var/cache/setup -P mingw64-i686-gcc-g++ -P mingw64-x86_64-gcc-g++ -P gcc-g++ -P autoconf -P automake -P bison -P libtool -P make -P python -P gettext-devel -P intltool -P libiconv -P pkg-config -P wget -P curl
C:\cygwin64\bin\bash -lc true

Write-Host "Installed Cygwin x64" -ForegroundColor Green





# compact folders
Write-Host "Compacting C:\cygwin..." -NoNewline
compact /c /i /s:C:\cygwin | Out-Null
Write-Host "OK" -ForegroundColor Green

Write-Host "Compacting C:\cygwin64..." -NoNewline
compact /c /i /s:C:\cygwin64 | Out-Null
Write-Host "OK" -ForegroundColor Green
