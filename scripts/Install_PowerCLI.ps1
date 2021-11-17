# Silent Install Firefox 
## Download URL: https://www.mozilla.org/en-US/firefox/all/
### When a new version of FireFox comes out, just change the firefox version or url to the new value

#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

$VerbosePreference = "continue"
Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

# Path for the Workdir
$workdir = "C:\tmp\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

Get-Location #displays location in the current PowerShell drive.
Set-Location $workdir
Get-Location

# install PowerCLI    
Install-Module -Name VMware.PowerCLI -Scope CurrentUser
#verify Installation of PowerCLI
Get-Module -ListAvailable VMware* 

# #uninstall all official PowerCLI modules except VMware.PowerCLI
# (Get-Module VMware.PowerCLI -ListAvailable).RequiredModules | Uninstall-Module -Force
# #uninstall the PowerCLI main module
# Get-Module VMware.PowerCLI -ListAvailable | Uninstall-Module -Force
