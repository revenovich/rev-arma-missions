$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
Write-host "My directory is $dir"
Push-Location $dir

scp -r dist/ rev@revoluxiant.io.vn:/home/rev/arma3files

Pop-Location