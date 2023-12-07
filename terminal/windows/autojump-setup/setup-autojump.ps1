# Install autojump from source
Invoke-Expression "git clone git://github.com/wting/autojump.git"
Invoke-Command {python3 autojump/install.py}
[System.Environment]::SetEnvironmentVariable('path', $env:LOCALAPPDATA + "\autojump\bin;" + [System.Environment]::GetEnvironmentVariable('path', "User"), "User")
