# Windows and PowerShell v7
PowerShell is now availale for every system.
* [Windows PowerShell Github Repository](https://github.com/PowerShell/PowerShell)
* [PowerShell Documentation](https://learn.microsoft.com/en-us/powershell/scripting/how-to-use-docs?view=powershell-7.3)
* [Windows Terminal - Github Repository](https://github.com/microsoft/terminal)
   - [Windows Terminal Documentation](https://learn.microsoft.com/en-us/windows/terminal/)
* [Microsoft Learn](https://learn.microsoft.com/en-us/)
   - [Microsoft Documentation](https://learn.microsoft.com/en-us/docs/)
   - [Microsoft Credentials and Certifications](https://learn.microsoft.com/en-us/credentials/browse/?credential_types=certification)
   - [Microsoft Training](https://learn.microsoft.com/en-us/training/)
## Command Line Reference
### SS64
SS64 is a reference guide containing syntax and examples for the most prevalent computing commands (Database and Operating System).
* [SS64 - Command line reference](https://ss64.com/)
- [A-Z Index of Windows PowerShell commands](https://ss64.com/ps/)
- [Windows PowerShell How-to guides and examples](https://ss64.com/ps/syntax.html)
## Installing PowerShell
* [Installing PowerShell on Windows, Linux and MacOS](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3)
* [Using PowerShell in Docker](https://learn.microsoft.com/en-us/powershell/scripting/install/powershell-in-docker?view=powershell-7.3)
## Getting Started with PowerShell
* [Learning PowerShell: Getting Started](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started?view=powershell-7.3)
## PowerShell Gallery
* [The PowerShell Gallery](https://learn.microsoft.com/en-us/powershell/scripting/gallery/overview?view=powershell-7.3)
* [PowerShellGet and the PowerShell Gallery](https://learn.microsoft.com/en-us/powershell/gallery/overview)
## PowerShell Scripting and Development
* [PowerShell Language Specification 3.0](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-01?view=powershell-7.3)
* [PowerShell: about Modules](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?source=recommendations)
### PowerShell Training
* [Review Windows PowerShell](https://learn.microsoft.com/en-us/training/modules/review-windows-powershell/?source=recommendations)
## PowerShell: Run with Elevated Permissions
* [SS64 - HowTo: Run with Elevated Permissions](https://ss64.com/ps/syntax-elevate.html)
### Windows sudo Equivalent: gsudo
* [gsudo - a sudo for															 Windows](https://github.com/gerardog/gsudo/tree/master)
## Windows OpenSSH
* [Get Started with OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)
* [HowTo Windows Terminal SSH](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh?source=recommendations)
   - [Connect using SSH](https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh?source=recommendations)
## Windows Package Manager: Winget
* [Winget - Windows Package Manager Tool](https://learn.microsoft.com/en-us/windows/package-manager/)
### WinGet Configuration
* [Winget - Winget Configuration](https://learn.microsoft.com/en-us/windows/package-manager/configuration/)

A Winget Configuration file is organized into ***two primary sections***:
1.[Assertions](https://learn.microsoft.com/en-us/windows/package-manager/configuration/create#assertions-section): Required preconditions
2.[Resources](https://learn.microsoft.com/en-us/windows/package-manager/configuration/create#resources-section): List of required installations and setting configurations to get the machines development's environment to the desired state.
#### Writing Winget Configuration File
- [How-to: Author Winget Configuration Files](https://learn.microsoft.com/en-us/windows/package-manager/configuration/create)
* [Format of Winget Configuration Files](https://learn.microsoft.com/en-us/windows/package-manager/configuration/create#file-format)
* [Schema of Winget Configuration Files](https://aka.ms/configuration-dsc-schema/)
- [Sample Winget Configuration Files](https://aka.ms/dsc.yaml). See the latest version of the [WinGet Configuration Schema](https://aka.ms/configuration-dsc-schema/).
#### Running a WinGet Configuration File
Command to run setup using Winget Configuration file:
- [`configure`](https://learn.microsoft.com/en-us/windows/package-manager/winget/configure?source=recommendations): Use the [Winget Configure Command](https://learn.microsoft.com/en-us/windows/package-manager/winget/configure) to run a Winget Configuration file for setting up a Windows machine to a desired development environment state. 
**Usage**: ````winget configure -f <C:/Users/<username>/winget-configs/config-file-name.dsc.yaml>````
#### Desired State Configuration (DSC)
PowerShell Desired State Configuration (DSC) is used by WinGet to automate the configuration of a Windows OS. See the [DSC resource doc] to learn more.
* [PowerShell Desired State Configuration (DSC)](https://learn.microsoft.com/en-us/powershell/dsc/overview)
##### DSC: Training and and Examples
* Training Module: [Implement Desired State Configuration (DSC)](https://learn.microsoft.com/en-us/training/modules/implement-desired-state-configuration-dsc/?source=recommendations)
* [Examples of PS Modules Containing DSC resources](https://www.powershellgallery.com/packages)
#### DSC Resources
List of ready-to-use ("inbox") [PowerShell Desired State Configuration Resources](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/overview#resources):
    * [Environment](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/environment/environment): Manage an environment varibale for a machine or process.
    * [MsiPackage](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/msipackage/msipackage): Install or uninstall an MSI package.
    * [Registry](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/registry/registry): Manage a registry key or value.
    * [Script](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/script/script): Run PowerShell script blocks.
    * [Service](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/service/service): Manage a Windows service.
    * [WindowsFeature](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/windowsfeature/windowsfeature): Install or uninstall a Windows role or feature.
    * [WindowsProcess](https://learn.microsoft.com/en-us/powershell/dsc/reference/psdscresources/resources/windowsprocess/windowsprocess): Start of stop a Windows process.
> Learn more about Winget Configurations with Dev Home and Dev Drives in the article [Setup your Windows Development Environment with DevHome](https://learn.microsoft.com/en-us/windows/dev-home/setup)
 
Also, see [Setup a Dev Drive](https://learn.microsoft.com/en-us/windows/dev-drive/) for more on optimizing Dev Drive volumes.
## Windows Development Environment
* [Setup development environment on Windows](https://learn.microsoft.com/en-us/windows/dev-environment/)
* [Windows - Dev Drive](https://learn.microsoft.com/en-us/windows/dev-drive/)
## Command Line and Scripting
* [Windows PowerShell Scripting](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.3&toc=%2Fwindows-server%2Fadministration%2Ftoc.json&bc=%2Fwindows-server%2Fbreadcrumbs%2Ftoc.json)
* [Windows Commands](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.3&toc=%2Fwindows-server%2Fadministration%2Ftoc.json&bc=%2Fwindows-server%2Fbreadcrumbs%2Ftoc.json)
## PowerShell File Extensions
* [Intro to PowerShell File Extensions](https://www.educba.com/powershell-file-extension/)
