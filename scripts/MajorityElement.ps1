function Find-MajorityElement {
    param(
        [int[]] $arr
    )

    $candidate = $arr[0]
    $count = 1

    # Find the potential majority element
    for ($i = 1; $i -lt $arr.Length; $i++) {
        if ($arr[$i] -eq $candidate) {
            $count++
        } else {
            $count--
            if ($count -eq 0) {
                $candidate = $arr[$i]
                $count = 1
            }
        }
    }

    # Verify candidate is indeed the majority element
    $count = 0
    foreach ($num in $arr) {
        if ($num -eq $candidate) {
            $count++
        }
    }

    # Determine if the candidate is the majority element
    if ($count -gt [math]::floor($arr.Length / 2)) {
        return $candidate
    } else {
        return -1  # -1 indicates no majority element
    }
}

# Example usage
$arr1 = @(2, 2, 1, 1, 1, 2, 2)
$majorityElement1 = Find-MajorityElement $arr1
if ($majorityElement1 -ne -1) {
    Write-Output "Majority Element: $($majorityElement1)"
} else {
    Write-Output "No Majority Element Found"
}

$arr2 = @(3, 4, 2, 4, 2, 4, 4)
$majorityElement2 = Find-MajorityElement $arr2
if ($majorityElement2 -ne -1) {
    Write-Output "Majority Element: $($majorityElement2)"
} else {
    Write-Output "No Majority Element Found"
}
