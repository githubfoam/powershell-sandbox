if ([System.Environment]::Is64BitOperatingSystem) {
    Write-Host "The operating system is 64-bit."

    $chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    $clearCacheArgs = "chrome://settings/clearBrowserData"
    $clearCacheArgs += "?&amp;showAdvanced=true&amp;settings=%7B%22'clearOnExit':true%7D&amp;_=1415806655832"
    Start-Process $chromePath -ArgumentList $clearCacheArgs

} else {
    Write-Host "The operating system is 32-bit."
    $chromePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    $clearCacheArgs = "chrome://settings/clearBrowserData"
    $clearCacheArgs += "?&amp;showAdvanced=true&amp;settings=%7B%22'clearOnExit':true%7D&amp;_=1415806655832"
    Start-Process $chromePath -ArgumentList $clearCacheArgs
}