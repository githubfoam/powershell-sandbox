# Module script MajorityElement.psm1

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

Export-ModuleMember -Function Find-MajorityElement
