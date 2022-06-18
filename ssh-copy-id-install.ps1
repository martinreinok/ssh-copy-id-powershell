Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
if(-not(Test-Path $profile)) { New-Item -path $profile -type file –force | Out-Null}
Add-Content -Path $profile -Value @'
function ssh-copy-id($host_at_address, $ssh_option)
{
if(-not($host_at_address)) { Write-Warning "`nPlease include parameter: host@address`nOptionally include ssh_options (eg '-p port')"; Return}
Get-Content $env:USERPROFILE\.ssh\id_rsa.pub | ssh $host_at_address $ssh_option "cat >> .ssh/authorized_keys"
}

'@
