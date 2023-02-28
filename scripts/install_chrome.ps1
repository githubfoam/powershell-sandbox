
$chrome_url = "http://dl.google.com/chrome/install/375.126/chrome_installer.exe"
$chrome_path = "C:\tmp\chrome_installer.exe"


if(Test-Path $chrome_path) {
  Write-Host "Google Chrome is already downloaded and installed."
} else {
  Write-Host "Downloading Google Chrome..."
  Invoke-WebRequest -Uri $chrome_url -OutFile $chrome_path
  
  if(Test-Path $chrome_path) {
    Write-Host "Google Chrome has been downloaded successfully."
  } else {
    Write-Warning "Failed to download Google Chrome. Please check the URL and try again."
    Exit
  }
}

Write-Host "Installing Google Chrome..."
Start-Process -FilePath $chrome_path -Args '/silent /install' -Verb RunAs -Wait; 
Write-Host "Google Chrome has been installed successfully."

Remove-Item -Path $Path\$Installer


