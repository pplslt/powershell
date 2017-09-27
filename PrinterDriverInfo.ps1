#Port information
Get-WMIObject -Class Win32_Printer -Computer localhost | Select Name,DriverName,PortName,Shared | ft -auto



#Driver version information
Get-PrinterDriver | Select-Object Name,Manufacturer,HardwareID,MajorVersion,@{
n="DriverVersion";e={

$ver = $_.DriverVersion
$rev = $ver -band 0xffff
$build = ($ver -shr 16) -band 0xffff
$minor = ($ver -shr 32) -band 0xffff
$major = ($ver -shr 48) -band 0xffff
"$major.$minor.$build.$rev"

}
}


