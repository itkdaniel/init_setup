# Cygwin - Linux on Windows
See [FAQ: Setting Up Cygwin](https://www.cygwin.com/faq/faq.html#faq.setup.cli) for help with cygwin64 setup
See [Installing and Updating Cygwin Packages](https://www.cygwin.com/install.html) for more information on cygwin installation.
Use the quick setup installation script [install_cygwin.ps1](https://www.powershellgallery.com/packages/AppVeyorBYOC/1.0.21/Content/scripts%5CWindows%5Cinstall_cygwin.ps1) for a default base cygwin64 setup.
See the complete [package list] for available packages to install


# Installation
### Windows
#### via PowerShell
Download the [cygwin setup installer](https://www.cygwin.com/setup-x86_64.exe). Run it any time you want to update or install a Cygwin package for 64-bit Windows
```bash
Invoke-WebRequest -Uri https://www.cygwin.com/setup-x86_64.exe -OutFile setup-x86_64.exe
```

Run the cygwin setup executable with `--help` option for complete list of [command line arguments](https://www.cygwin.com/faq/faq.html#faq.setup.cli)
```bash
setup-x86_64.exe --help
```

Run the cygwin setup installer with the following arguments to specify installation directory, site and packages to install
```bash
setup-x86_64.exe -qnNdO -R C:\cygwin64 -s https://cygwin.mirror.constant.com -l C:\cygwin64\var\cache\setup -P [package-name] -P [package-name] ...
```

Add the cygwin root directory to `PATH`:
**Using Command Prompt**
```bash
set PATH=%SYSTEMDRIVE%\cygwin64\bin;%PATH%
```

**Repeat the run setup installer step as needed to update or install packages**
