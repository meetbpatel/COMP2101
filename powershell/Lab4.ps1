#Hardware discription 
#$hardwarediscription = Get-WmiObject Win32_computersystem
Write-output "----Hardware Description----"
write-output (Get-WmiObject Win32_computersystem) `n

#OPerating system
Write-output "----Operating System Name----"
write-output (Get-WmiObject Win32_OperatingSystem).Caption `n


#Processor Details

$processordetails = Get-WmiObject Win32_processor
if(($processordetails).MaxClockSpeed -ne $null)
{
	Write-output "----Processor Clock Speed Details----"
	Write-output "MaxClockSpeed" 
	Write-output "--------------" ($processordetails).MaxClockSpeed `n
} 
if((Get-WmiObject Win32_processor).NumberOfCores -ne $null)
{
	Write-output "----Processor Number of Cores Details----"
	Write-output "Number of Cores"	
	Write-output "----------------" (Get-WmiObject Win32_processor).NumberOfCores `n
} 
if((Get-WmiObject Win32_processor).L1CacheSize -eq $null)
{
	Write-output "----Processor L1 Cache Size----"
	Write-output "L1 Cache Size"
	Write-output "--------------" (Get-WmiObject Win32_processor).L1CacheSize `n
}
if(($processordetails).L2CacheSize -eq $null)
{
	Write-output "----Processor L2 Cache Size----"
	Write-output "L2 Cache Size"
	Write-output "--------------" ($processordetails).L2CacheSize `n
}
if(($processordetails).L3CacheSize -ne $null)
{
	Write-output "----Processor L3 Cache Size----"
	Write-output "L3 Cache Size"
	Write-output "--------------" ($processordetails).L3CacheSize `n
}


$physicalmemory = Get-WmiObject Win32_physicalmemory
if((Get-WmiObject Win32_physicalmemory).Manufacturer -ne $null)
{
	Write-output "----Physical Memory Vendor----"
	Write-output "Manufacturer(Vendor)"
	Write-output "--------------------" ($physicalmemory).Manufacturer `n
}
if((Get-WmiObject Win32_physicalmemory).Description -ne $null)
{
	Write-output "----Physical Memory Description----"
	Write-output "Description"
	Write-output "------------" ($physicalmemory).Description `n
}
if((Get-WmiObject Win32_physicalmemory).Capacity -ne $null)
{
	Write-output "----Physical Memory Size----"
	Write-output "Size(Capacity)"
	Write-output "-----" ($physicalmemory).Capacity `n
}
if((Get-WmiObject Win32_physicalmemory).BankLabel -ne $null)
{
	Write-output "----Physical Memory BankLabel----"
	Write-output "BankLabel"
	Write-output "----------" ($physicalmemory).BankLabel `n
}


#Network Adapter Configuration Lab3
Write-output "----Network Adapter Configuration Lab3----"
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | 
Where-Object -Filter {("IPEnabled=True")} | 
Format-Table -Property Description,Index,IPAddress,DefaultIPGateway,DNSDomain,ServiceName


#Video Card Details
$videocontroller = Get-WmiObject Win32_videocontroller
foreach ($vc in $videocontroller) {
      $vcname = $vc| -Property Name
      foreach ($vcd in $vcname) {
            $vcdesc = $vcd | -Property Description
            foreach ($ld in $lcd) {
                     new-object -typename psobject -property @{Name=$vc.Name                                                               
                                                               Description=$ld.Description
                                                               Resouluation=$lcd.VideoModeDescription
                                                               }
           }
      }
  }
if(($videocontroller).Name -ne $null)
{
	Write-output "----Video Control----"
	Write-output "Name"
	Write-output "-----" ($videocontroller).Name `n
}
if(($videocontroller).Description -ne $null)
{
	Write-output "Description"
	Write-output "------------" ($videocontroller).Description `n
}
if(($videocontroller).VideoModeDescription -ne $null)
{
	Write-output "Resoluation"
	Write-output "------------" ($videocontroller).VideoModeDescription `n
}