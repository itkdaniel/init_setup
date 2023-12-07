# Autojump - cd that learns
autojump is a faster way to navigate your filesystem. It works by ***maintaining a database*** of the directories you use the most from the command line.
See the [Autojump Github Repo](https://github.com/wting/autojump/tree/master) for more information.
*Directories must be visited first before they can be **jumped** to*

## Installation
### Requirements
* Python 2.6+ or Python 3.3+
* Supported Shells:
    - bash 
    - zsh
    - fish
    - tcsh
    - clink
* Supported Platforms:
    - Linux
    - OS X
    - Windows 
    - BSD
* Supported Installation Methods:
    - source code
    - Debian and derivatives
    - ArchLinux / Gentoo / openSUSE / RedHat and derivatives
    - Homebrew / MacPorts
### Manual: From Source
Download the source code from the [autojump github page](https://github.com/wting/autojump/tree/master)
```bash
git clone git://github.com/wting/autojump.git
# or 

git clone https://github.com/wting/autojump/tree/master
```

Run the installation script and follow the on-screen instructions
```bash
cd autojump 
./install.py
# or
./uninstall.py
```

### Automatic: Package Management Repos
#### Linux
Autojump is included in the following distro repositories, please use relevant package management utilities to install **==--- e.g apt-get, yum, pacman, etc... ---==**:
* Debian, Ubuntu, Linux Mint
All Debian-derived distros require **manual activation** for policy reasons, please see `/usr/share/doc/autojump/README.debian`.
* RedHat, Fedora, CentOS
Install `autojump-zsh` for zsh, `autojump-fish` for fish, etc...
* ArchLinux
* Gentoo
* Frugalware
* Slackware

#### OSX
Homebrew is the recommended installation method for Mac OSX
```bash
brew install autojump
```
MacPorts is also available:
```bash
port install autojump
```

#### Windows
Windows support is enabled by [clink](https://mridgers.github.io/clink/) which should be installed **prior** to installing autojump.
Autojump uses `python`, so add python to `%PATH%`.
```bash
set PATH=%PATH%;%PYTHON_PATH%
```
- **Alternatively**, if using `pyenv` then add `%USERPROFILE%\.pyenv\pyenv-win\bin` and `%USERPROFILE%\.pyenv\pyenv-win\shims` to `%PATH%` (*if not already added*).

Download the `autojump` **[source repository](https://github.com/wting/autojump/tree/master).**
```bash
git clone git://github.com/wting/autojump.git
# or git clone https://github.com/wting/autojump/tree/master
```

Install `autojump` by following the [README](https://github.com/wting/autojump#readme):
```bash
cd autojump
python3 install.py
# uninstall.py for uninstalling
```
**After installation**, add autojump's `bin` folder to `%PATH%`:
```bash
set PATH=%PATH%;%USERPROFILE%\AppData\Local\autojump\bin
```
***Note***: _If using `cmder`, add the `bin` folder to `%PATH` via `C:\apps\cmder\config\user-profile.cmd`_

#### [Bug Fix][bugfix]: Windows

[bugfix]:  https://leetschau.github.io/autojump-in-windows-console.html

***There are ==2^0^-2^1^=1-2== bugs for `autojump` on ==Windows~10-11~==***.

1. [Improper *backslash* handling in `autojump_match.py`](https://github.com/wting/autojump/issues/436) on lines **78-80**. Replace with the following:
    ```python
    os_sep = '\\\\' if os.sep == '\\' else os.sep
    regex_no_sep = '[^' + os_sep + ']*'
    regex_no_sep_end = regex_no_sep + '$'
    regex_one_sep = regex_no_sep + os_sep + regex_no_sep
    ```
2. [Running autojump on Windows with `clink`](https://github.com/wting/autojump/issues/308). Add the following `doskey` alias for *command prompt* (**update**: already fixed for newer versions of autojump):
   ```bash
   doskey cd=cd $*$Tautojump -i $Gnul
   ```
    **Alternatively**, if using `cmder`, add the alias to `C:\apps\cmder\config\user-aliases.cmd` (omit doskey).
## Usage
`j` is a convenience wrapper function around `autojump`. Any option that can be used with `autojump` can be used with `j` and vice versa.

* Jump to a directory that contains `foo`:
    ```bash
    j foo
    ```

* Jump to a child directory 
Sometimes is useful to jump to a child directory (sub-directory of current directory) rather than typing out the full name:
    ```bash
    jc bar
    ```

* Opening file manager to a child directory:
    ```bash
    jco images
    ```

* Using multiple arguments
Let's assume the following autojump database:
    ```bash
    30   /hom/user/mail/inbox
    10   /home/user/work/inbox
    ```
`j in` would jump into `/home/user/mail/inbox` as the higher weighted entry. However, you can pass multiple arguments to autojump to prefer a different entry. In the above example, `j w in` would then change directory to `/home/user/work/inbox`.


For more options, refer to help:
```bash
autojump --help
```
