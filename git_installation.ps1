## Install Git
$installerFilename = ".\Git-" + $versionToInstall + "-64-bit.exe"
$installer = Resolve-Path $installerFilename
Write-Host "Running Git installer:" $installer
$optionsFile = Resolve-Path ".\install-defaults.txt"

$logFile = $env:TEMP + "\Git-install-" + $timestamp + ".log"

$commandLineOptions = '/SP- /VERYSILENT /SUPPRESSMSGBOXES /FORCECLOSEAPPLICATIONS /LOADINF="'+ $optionsFile + '" /LOG="' + $logFile + '"'
Write-Host "With options:" $commandLineOptions

Start-Process -Wait -FilePath $installer -ArgumentList $commandLineOptions

## Configure git with some defaults
### Set git as a command alias
if (!(Test-Path -Path "alias:git")) 
{
   new-item -path alias:git -value 'C:\Program Files\Git\bin\git.exe'
}
### Invoke git commands that set defaults for user.
git config --global credential.helper wincred
git config --global push.default simple
git config --global core.autocrlf true

Write-Host "Git installer done."
