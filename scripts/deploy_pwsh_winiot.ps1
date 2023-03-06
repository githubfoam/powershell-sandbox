#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
#Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

$VerbosePreference = "continue"
Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

# Replace the placeholder information for the following variables:
$deviceip = '<device ip address'
$zipfile = 'PowerShell-7.2.1-win-Arm64.zip'
$downloadfolder = 'u:\users\administrator\Downloads'  # The download location is local to the device.
    # There should be enough  space for the zip file and the unzipped contents.

# Create PowerShell session to target device
Set-Item -Path WSMan:\localhost\Client\TrustedHosts $deviceip
$S = New-PSSession -ComputerName $deviceIp -Credential Administrator
# Copy the ZIP package to the device
Copy-Item $zipfile -Destination $downloadfolder -ToSession $S

#Connect to the device and expand the archive
Enter-PSSession $S
Set-Location u:\users\administrator\Downloads
Expand-Archive .\PowerShell-7.2.1-win-Arm64.zip

# Set up remoting to PowerShell 7
Set-Location .\PowerShell-7.2.1-win-Arm64
# Be sure to use the -PowerShellHome parameter otherwise it tries to create a new
# endpoint with Windows PowerShell 5.1
.\Install-PowerShellRemoting.ps1 -PowerShellHome .

