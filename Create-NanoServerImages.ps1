# Set Location to my working directory and import helper module for Nano Server image generation
Set-Location C:\Nano
Import-Module .\NanoServerImageGenerator.psm1

# Harvest four domain join blobs for the Nano Servers.
# Servernames will be n01 through n04
1..4 | ForEach-Object {djoin /Provision /Domain vdi.local /Machine n0$_ /SaveFile n0$_.txt}

# Create Nano Server VHD files using the above imported module and the domain join blobs.
$NanoPass = (ConvertTo-SecureString -AsPlainText -Force -String "P@ssw0rd")
1..4 | ForEach-Object {New-NanoServerImage -BasePath C:\nanotemp -TargetPath C:\Nano\Nano_compute_n0$_.vhd -Compute -Storage -Clustering -OEMDrivers -DriversPath C:\nano\vmdrivers -DomainBlobPath .\n0$_.txt -Language en-us -AdministratorPassword $NanoPass}