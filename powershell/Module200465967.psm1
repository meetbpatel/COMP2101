set-item -path alias:np -value notepad

function welcome {
write-output "Welcome to planet $env:computername Overlord $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write-output "It is $now."
}

function get-cpuinfo {
$sys = get-ciminstance cim_processor
write-output "Manufacturer:" $sys.Manufacturer
write-output "Model:" $sys.DeviceID
write-output "Current clock speed:" $sys.CurrentClockSpeed
write-output "Maximum clock speed:" $sys.MaxClockSpeed
write-output "Number of cores:" $sys.NumberOfCores
}

function get-mydisks {
wmic diskdrive get Manufacturer,Model,SerialNumber,FirmwareRevision,Size
}

#Export-ModuleName -Function Module200465967