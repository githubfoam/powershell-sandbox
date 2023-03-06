#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
#Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

# $VerbosePreference = "continue"
# Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

# Path for the Workdir
$directory = "E:\infrastructure v10\"
$strsearch = 'passwordless'

# $files = Get-ChildItem $directory -Include *.doc,*.docx -Recurse
$files = Get-ChildItem -Path $directory -Include "*.doc*" -Recurse

$application = New-Object -ComObject word.application
$application.visible = $false
$results = @()

Function getStringMatch{
    Foreach ($file in $files){
        $document = $application.documents.open($file.FullName,$false,$true)
        $contents = $document.content
        If($contents.Text -match "$($strsearch)"){
            $fileName = $file.FullName
            $results += "$fileName `n"
        }
        $document.close()
    }
    If($results){
        Write-Host "Found $strsearch in the following documents: "
        Write-Host $results
    }
    #$document.close()
    $application.quit()
}
getStringMatch


