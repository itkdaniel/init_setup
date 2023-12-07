# ZLocation Setup
See [ZLocation Github Repo](https://github.com/vors/ZLocation) for more information on setup and installation.
* Works on Windows, Linux, and MacOS

## Installation
Install from [PowerShellGet Gallery](https://www.powershellgallery.com/packages/ZLocation/) using `Install-Module`
```powershell
Install-Module ZLocation -Scope CurrentUser
```

Make sure to add import ZLocation in `$PROFILE` - It does not do so automatically. The following one-liner installs ZLocation, imports it into the current terminal session and adds it to a profile. 
```powershell
Install-Module ZLocation -Scope CurrentUser; Import-Module ZLocation; Add-Content -Value "`r`n`r`nImport-Module ZLocation`r`n" -Encoding utf8 -Path $PROFILE.CurrentUserCurrentHost
```

Additionally, if you want to display some additional information about ZLocation on start-up, you can put the following snippet in `$PROFILE` after the import:
```powershell
Write-Host -Foreground Green "`n[ZLocation] knows about $((Get-ZLocation).Keys.Count) locations.`n"
```

**==---Note---==**: If using ZLocation module with other modules that modifies the prompt function (e.e `posh-git`), then you need to adjust your [PowerShell Profile file](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7) to add the ZLocation import statement `Import-Module ZLocation` **after** the other module imports that modifie the prompt function.
