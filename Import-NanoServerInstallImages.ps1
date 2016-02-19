﻿# Import the VHD files as WDS Install Images
1..4 | ForEach-Object {
    $params = @{
        Path= "C:\Nano\Nano_compute_n0$_.vhd";
        NewImageName = "Nano-n0$_-10.0.10586"
    }
    Import-WdsInstallImage @params 
} 