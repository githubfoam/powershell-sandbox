#ChatGPT
#a PowerShell script that retrieves and sets the execution policy for the script runner
#sets a new execution policy using the Set-ExecutionPolicy cmdlet with the -Scope CurrentUser, -ExecutionPolicy Unrestricted, and -Force parameters. 
#This will allow scripts to run without any restrictions. Note that you should use caution when setting the execution policy to Unrestricted, 
#as it can potentially pose a security risk.


# Get current execution policy
$executionPolicy = Get-ExecutionPolicy -Scope CurrentUser

# Print current execution policy
Write-Host "Current execution policy is: $executionPolicy"

# Set new execution policy
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force

# Print new execution policy
Write-Host "New execution policy is: $(Get-ExecutionPolicy -Scope CurrentUser)"
