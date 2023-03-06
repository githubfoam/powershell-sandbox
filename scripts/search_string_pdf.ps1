#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
#Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

# $VerbosePreference = "continue"
# Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

$directoryToSearch = 'E:\infrastructure v10\storage\IBM Storwize V5000'
$lookingfor = 'Spectrum'
$word = New-Object -ComObject Word.Application

Get-ChildItem -Path $directoryToSearch -Include "*.pdf" -Recurse | foreach-object {
  $file = $_.FullName
  
  if ($_.FullName.SubString(5) -match '.pdf') {

    if ((Get-Content $file | %{$_ -match $lookingfor }) -contains $true) {
        write-host WARNING: $_.FullName contains $lookingfor     
    }
    $word.Application.ActiveDocument.Close()
  } 

  # if ($_.FullName.SubString(5) -match '.docx') {
  #   if ($word.Documents.Open($file).Content.Find.Execute($lookingfor)) {
  #     write-host WARNING: $_.FullName contains $lookingfor
  #   }
  #   $word.Application.ActiveDocument.Close()
  # } 
  # else {
  #   if ((Get-Content $file | %{$_ -match $lookingfor }) -contains $true) {
  #       write-host WARNING: $_.FullName contains $lookingfor
  #       #Add-Content c:\temp\log.txt WARNING: $_.FullName contains $lookingfor
  #   }
  # }
}
$word.Application.quit(0)


