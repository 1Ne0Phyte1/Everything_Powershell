$time =Get-Date -Format "HH:MM"
$time
$time.Substring(0,2)
$cut=$time.Substring(0,2)
$shut=23-$cut
$timer=$shut*3600

shutdown -s -t $timer

