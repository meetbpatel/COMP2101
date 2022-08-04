Get-WmiObject -Class Win32_NetworkAdapterConfiguration | 
Where-Object -Filter {("IPEnabled=True")} | 
Format-Table -Property Description,Index,IPAddress,DefaultIPGateway,DNSDomain,ServiceName