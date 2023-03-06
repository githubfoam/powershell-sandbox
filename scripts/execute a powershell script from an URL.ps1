#ChatGPT
#To execute a PowerShell script from an URL, you can use the Invoke-WebRequest cmdlet to download 
#the script from the URL and then use the Invoke-Expression cmdlet to run the downloaded script.

$url = "https://example.com/myscript.ps1"
$script = Invoke-WebRequest -Uri $url -UseBasicParsing
Invoke-Expression -Command $script.Content
