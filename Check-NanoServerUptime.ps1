# Create CIM Sessions to the Nano Servers
$cimSessions = New-CimSession -ComputerName n01,n02,n03,n04

# Get system uptime via CIM to verify the servers 
$params = @{
    CimSession = $cimSessions;
    ClassName = "Win32_OperatingSystem" 
}
Get-CimInstance @params | Select-Object PsComputerName,@{n='UpTime';e={$_.LocalDateTime - $_.LastBootUpTime}}