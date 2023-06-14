#ChatGPT
#Generate a PowerShell script that assumes that each line in the log file is tab-separated and contains three fields in the order of IP Address, Time Stamp, and City. If the line matches the expected order it splits each line using the tab character and checks if the line contains the expected number of fields. If the line contains the expected number of fields it trims the fields and checks if the IP address, timestamp, and city have the proper format. If the line or any of the fields in the line do not match the expected format, it indicates an anomaly and prints the line.

#$LogFilePath = "C:\path\to\log\file.txt"
$LogFilePath = "scripts\inputs\logfile.txt"

# Read the log file
$LogFileContent = Get-Content -Path $LogFilePath

# Skip the first line (header)
$LogFileContent = $LogFileContent | Select-Object -Skip 1

# Initialize an array to store lines with anomalies
$anomalies = @()

# Iterate through each line in the log file
foreach ($line in $LogFileContent) {
    # Split the line by the tab character
    $fields = $line -split '\t'

    # Check if the line contains the expected number of fields
    if ($fields.Length -eq 3) {
        $ipAddress = $fields[0].Trim()
        $timestamp = $fields[1].Trim()
        $city = $fields[2].Trim()

        # Check if the IP address, timestamp, and city have the proper format
        $ipRegex = '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$'
        $timeRegex = '^\d{2}:\d{2}:\d{2}$'
        $cityRegex = '^[a-zA-Z\s]+$'

        if (-not ($ipAddress -match $ipRegex -and $timestamp -match $timeRegex -and $city -match $cityRegex)) {
            $anomalies += $line
        }
    } else {
        $anomalies += $line
    }
}

# Output the lines with anomalies
if ($anomalies.Count -gt 0) {
    Write-Output "Lines with anomalies:"
    $anomalies
} else {
    Write-Output "No anomalies found."
}