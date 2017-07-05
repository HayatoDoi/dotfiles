function Get-GitBranchName () {
    $str = git branch --contains=HEAD 2>$null | Select-String "^\* " | % {$_ -creplace "\* ",""}
    if ( $? ) {
        return $str
    }
    else {
        return "---"
    }
}

function prompt {

    $bname = $(Get-GitBranchName)
    Write-Host "[ " -NoNewline
    if ( $bname -eq "---" ) {
        Write-Host "$bname" -NoNewline
    }
    elseif ($bname -eq "master") {
        Write-Host "$bname" -NoNewline -ForegroundColor Red
    }
    else {
        Write-Host "$bname" -NoNewline -ForegroundColor Cyan
    }
    Write-Host " ] $(get-location)"
    Write-Host ">>>" -NoNewline
    return " "
}
