#script,Find Computer name for set of IP addresses from CSV
#create the csv file ip-addresses.csv which includes the column IPAddress in the csv file
#get the machinename list in the txt file machinenames.txt
#get the hostname and IP address list in the csv file machinenames.csv
Import-Csv -Path "D:\pws_scripts\inputs\ip-addresses.csv"| ForEach-Object{
# Import-Csv C:ip-Addresses.csv | ForEach-Object{  
  $hostname = ([System.Net.Dns]::GetHostByAddress($_.IPAddress)).Hostname
  if($? -eq $False){
  $hostname="Cannot resolve hostname"
  }
  New-Object -TypeName PSObject -Property @{
        IPAddress = $_.IPAddress
        HostName = $hostname
  # }} | Export-Csv C:machinenames.csv -NoTypeInformation -Encoding UTF8
  }} | Export-Csv -Path D:\pws_scripts\outputs\machinenames.csv -NoTypeInformation -Encoding UTF8