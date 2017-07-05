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
    "$env:username@[ "+ $(Get-GitBranchName) +" ] " + $(get-location) + "
> "
}
