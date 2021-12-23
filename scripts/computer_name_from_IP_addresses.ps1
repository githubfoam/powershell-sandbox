#script,Resolve Hostname for set of IP addresses from text file,find computer name for multiple IP addresses
#create the text file ip-addresses.txt which includes one IP address in each line
#creates the machinename list in the txt file machinenames.txt

# Get-Content -Path D:\pws_scripts\ip-addresses.txt | ForEach-Object{
Get-Content -Path ".\scripts\inputs\ip-addresses.txt" | ForEach-Object{
#Get-Content C:ip-addresses.txt | ForEach-Object{
$hostname = ([System.Net.Dns]::GetHostByAddress($_)).Hostname
if($? -eq $True) {
  $_ +": "+ $hostname >> outputs\machinenames.txt
  # $_ +": "+ $hostname >> "D:\pws_scripts\machinenames.txt"
}
else {
   $_ +": Cannot resolve hostname" >> "D:\pws_scripts\machinenames.txt"
}}