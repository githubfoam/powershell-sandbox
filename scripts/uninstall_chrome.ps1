# Check if Google Chrome is installed
$chrome = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -like "Google Chrome" }

if ($chrome -eq $null) {
    Write-Host "Google Chrome is not installed."
} else {
    # Uninstall Google Chrome
    Write-Host "Uninstalling Google Chrome..."
    $uninstall = $chrome.UninstallString -replace "/install", "/uninstall"
    Start-Process cmd.exe -ArgumentList "/c", "$uninstall /quiet /norestart" -Wait
    Write-Host "Google Chrome has been uninstalled."
}
