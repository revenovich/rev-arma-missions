$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
Write-host "My directory is $dir"
Push-Location $dir

# Path of upload folder
$upload_folder = "dist/"

# Remote path
$remote_path = "rev@revoluxiant.io.vn:/home/rev/storage/arma3files"

scp -r $upload_folder $remote_path

Pop-Location