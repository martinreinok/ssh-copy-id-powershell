Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
if(-not(Test-Path $profile)) { New-Item -path $profile -type file –force | Out-Null}
Add-Content -Path $profile -Value @'
function ssh-copy-id($host_at_address, $ssh_option) {
    if (-not $host_at_address) {
        Write-Warning "Usage: ssh-copy-id host@address [-p port]"
        return
    }

    $keys = Get-ChildItem "$env:USERPROFILE\.ssh\" -Filter "*.pub"
    $keys | ForEach-Object -Begin { $i = 1 } -Process { Write-Host "[$i] $($_.Name)"; $i++ }

    $choice = Read-Host "Select key number"
    $keyFile = $keys[[int]$choice - 1].FullName

    Get-Content $keyFile | ssh $host_at_address $ssh_option "cat >> .ssh/authorized_keys"
    Write-Host "Key $($keyFile) copied to $host_at_address"
}

'@
