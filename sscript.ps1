Start-Transcript 
New-Item -Path 'C:\Pow' -ItemType Directory
$Path = "C:\"
Get-ChildItem  $Path -recurse -force 
Stop-Transcript