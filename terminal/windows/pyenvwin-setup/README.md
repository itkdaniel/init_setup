# Pyenv-Win Usage
See [Pyenv-Win Github Repo](https://github.com/pyenv-win/pyenv-win/tree/master) for more information.

## Installation
### PowerShell
This is the **easiest way** to install `pyenv-win`. Simply run the following command in a PowerShell terminal:
```powershell
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
```
> If getting error **UnauthorizedAccess** then start Windows PowerShell with **==--- Run as administrator ---==** option, and then run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine`, now **rerun** the installation command above.

### Git
This is the **default way** to install `pyenv-win`. Requires `git` or `git-bash` for windows to be installed. 
If using PowerShell or Git Bash, use `$HOME` instead of `%USERPROFILE%` for command prompt.
Run the following command to install using `git`:
```bash
git clone https://github.com/pyenv-win/pyenv-win.git "%USERPROFILE%\.pyenv"
```
#### Update Environment Variables
Using PowerShell:
1. Add `PYENV`, `PYENV_HOME`, and `PYENV_ROOT` to your Environment Variables
   ```powershell
   [System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
   [System.Environment]::SetEnvironmentVariable('PYENV_ROOT',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
   [System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
   ```
2. Now add the following paths to your **USER PATH** variable in order to access the `pyenv` command
   ```powershell
   [System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User")
   ```
Using Command Prompt:
1. Add `PYENV`, `PYENV_HOME`, `PYENV_ROOT` to Environment Variables
   ```bash
   set PYENV=%USERPROFILE%\.pyenv\pyenv-win;%PATH%
   set PYENV_ROOT=%USERPROFILE%\.pyenv\pyenv-win;%PATH%
   set PYENV_HOME=%USERPROFILE%\.pyenv\pyenv-win;%PATH%
   ```
2. Add `bin` and `shims` directory to `%PATH%`
   ```bash
   set PATH=%USERPROFILE%\.pyenv\pyenv-win\bin;%USERPROFILE%\.pyenv\pyenv-win\shims;%PATH%
   ```

***Installation is done!***

## Usage
### Validate Installation
1. Reopen terminal and run `pyenv --version`
2. Type `pyenv` to view its usage
> If getting ***"command not found"*** error, see [manually check the settings](https://github.com/pyenv-win/pyenv-win#manually-check-the-settings)

> **Note**: If running Windows 10 1905 or newer, you might need to disable the *built-in Python launcher* via: `Start > "Manage App Execution Aliases"` and turn off the *"App Installer"* aliases for python.

### Usage
* To view a list of python versions supported by pyenv windows: `pyenv install -l`
* To filter the list: `pyenv install -l | findstr 3.9`
* To install a python version: `pyenv install 3.9.2`
   - ***Note***: *An install wizard may pop up for some non-silent installs. You'll need to click through the wizard during installation. Theres no need to change any options in it.* ***Use `-q` for quiet installation***.
   - You can also install *multiple* versions in one command: `pyenv install 2.4.3 3.10.12`
* To set a **global** python version: `pyenv global 3.10.12` 
   - This is the version of python that will be used by default if a local version (see below) isn't set.
   - *Note*: The version must first be installed.
* To set a python version as the local version: `pyenv local 3.9.2`
   - This is te version of python that will be used whenever `python` is called from within this folder. This is different than a virtual environment, which needs to be **explicitly** activated.
   - *Note*: The version must first be installed.
* After (un)installing any libraries using pip or modifying the files in a version's folder, you must run `pyenv rehash` to update the pyenv with new shims for the python and librarie's executables.
   - *Note*: This must be run **outside** of the `.pyenv` folder. 
* To uninstall a python version: `pyenv uninstall 3.9.2`
* To view which python you are using and its path: `pyenv version`
* To view all the python versions installed on this system: `pyenv versions`
* To update the list of discoverable Python versions use: `pyenv update` command for pyenv-win `2.64.x` and `2.32.x` versions.

## Updating Pyenv-Win
### Installed via PowerShell/Installer
- Run the following command in a PowerShell terminal: `&"${env:PYENV_HOME}\install-pyenv-win.ps1"`

### Installed via Git
- Go to `%USERPROFILE%\.pyenv\pyenv-win` **==--- your installed path ---==** and run: `git pull`

> See the pyenv-win [README](https://github.com/pyenv-win/pyenv-win/blob/master/README.md#installation) and [Git Repo](https://github.com/pyenv-win/pyenv-win/tree/master) for more information.
