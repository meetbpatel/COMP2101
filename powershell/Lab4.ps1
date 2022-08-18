Function Lab{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true)]
        [String[]]$ComputerName="."
    )
    Begin{}
    Process{
        foreach($Computer in $ComputerName){
	    $cpu=Get-WmiObject Win32_processor 
            $os=Get-Wmiobject Win32_OperatingSystem 
	    $ram=Get-WmiObject Win32_physicalmemory
	    $video=Get-WmiObject Win32_videocontroller
	    $network=Get-WmiObject -Class Win32_NetworkAdapterConfiguration
            
	    write-output "****** -System, -Disk, -Network ******"

            $presenting=[ordered] @{ #With or without [ordered]
                'Name'=$Computer;
		'CPU_mxclkspeed'=$cpu.MaxClockSpeed;
	 	'cpu_NumberOfCores'=$cpu.NumberOfCores;
		'cpu_L1cachesize'=$cpu.L1CacheSize;
		'cpu_L2cachesize'=$cpu.L2CacheSize;
		'cpu_L3cachesize'=$cpu.L3CacheSize;
                'OS'=$os.caption;
                'videoname'=$video.Name;
		'videodescription'=$video.Description;
		'rammanufacturer'=$ram.Manufacturer;
		'ramdescription'=$ram.Description;
		'ramsize(capacity)'=$ram.Capacity;
		'rambanklabel'=$ram.BankLabel;
		'networkdescription'=$network.Description;
		'networkIndex'=$network.Index;
		'networkIPAddress'=$network.IPAddress;
		'networkdefaultgateway'=$network.DefaultIPGateway;
		'networkDNSdomain'=$network.DNSDomain;
		'networkServicename'=$network.ServiceName
		
            }
        $createnewobject=New-Object -TypeName PSObject -Property $presenting
        Write-Output $createnewobject	
        } 
    }
    End{}
}


$informationmodified = Lab DESKTOP-FFGJRUF
$informationmodified
