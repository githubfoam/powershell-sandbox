# Import the module
# Import-Module -Name ./MajorityElement.psm1
Import-Module -Name ./scripts/MajorityElement.psm1

# Example arrays
$arr1 = @(2, 2, 1, 1, 1, 2, 2)
$arr2 = @(3, 4, 2, 4, 2, 4, 4)

# Find majority element and display result
$majorityElement1 = Find-MajorityElement -arr $arr1
if ($majorityElement1 -ne -1) {
    Write-Output "Majority Element: $($majorityElement1)"
} else {
    Write-Output "No Majority Element Found"
}

$majorityElement2 = Find-MajorityElement -arr $arr2
if ($majorityElement2 -ne -1) {
    Write-Output "Majority Element: $($majorityElement2)"
} else {
    Write-Output "No Majority Element Found"
}
