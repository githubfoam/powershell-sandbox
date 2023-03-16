# Get the current version of PowerShell
$currentVersion = $PSVersionTable.PSVersion.ToString()
Write-Host "Current version of PowerShell: $currentVersion"

# Get the latest stable version of PowerShell
$latestRelease = Invoke-RestMethod "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
$latestVersion = $latestRelease.tag_name.Replace("v", "")
Write-Host "Latest version of PowerShell: $latestVersion"

# Check if a new stable release is available
if ([version]$latestVersion -gt [version]$currentVersion) {
    # Download the PowerShell installer for the latest release
    $downloadUrl = $latestRelease.assets | Where-Object { $_.name -like "*win-x64.msi" } | Select-Object -ExpandProperty browser_download_url
    $installerPath = "$env:TEMP\PowerShell-$latestVersion-win-x64.msi"
    Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

    # Install the latest stable version of PowerShell
    Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait
    Write-Host "PowerShell has been successfully upgraded to version $latestVersion."
} else {
    Write-Host "You are already using the latest version of PowerShell."
}
