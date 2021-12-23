#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

$VerbosePreference = "continue"
Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

Write-Host "####################################################################"
Write-Host "###################### whoami ######################################"
Write-Host "####################################################################"

Write-Host "current user:"
Write-Host $(whoami)

whoami /all

Write-Host "####################################################################"
Write-Host "###################### download msopenjdk ########################"
Write-Host "####################################################################"

# https://docs.microsoft.com/en-us/java/openjdk/install#change-the-default-jdk-on-linux

# Path for the Workdir
$workdir = "C:\tmp\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

$source = "https://aka.ms/download-jdk/microsoft-jdk-17.0.1.12.1-windows-x64.msi"           
$destination = "$workdir\microsoft-jdk-17.0.1.12.1-windows-x64.msi"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

msiexec /i $destination ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome INSTALLDIR="c:\Program Files\Microsoft\" /quiet
 

