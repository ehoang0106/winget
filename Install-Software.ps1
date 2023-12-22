$packages = @("Microsoft.Office", "GlavSoft.TightVNC", "Adobe.Acrobat.Reader.64-bit", "Google.Chrome", "Mozilla.FireFox")


function Install-Winget {
    
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Winget is already installed!"
        Write-Host "Continue in 2s"
        Start-Sleep 2
    }
    else {
        $progressPreference = 'silentlyContinue'
        Write-Information "Downloading WinGet and its dependencies..."
        Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
        Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
        Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile Microsoft.UI.Xaml.2.7.x64.appx
        Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
        Add-AppxPackage Microsoft.UI.Xaml.2.7.x64.appx
        Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    }
}

function Install-Package {
    param (
        [string[]] $packages
    )
    
    winget install -e --id $packages --accept-package-agreements -- accept-source-agreements
}



function Uninstall-Package {
    param (
        [string[]] $packages
    )
    Write-Host "Select the app you want to uninstall"
    for ($i = 0; $i -lt $packages.Count; $i++) {
        Write-Host "$($i + 1). $($packages[$i])"
    }

    $option = Read-Host "Select"

    for ($i = 0; $i -lt $packages.Count; $i++) {
        if ($option -eq "$($i + 1)") {
            winget uninstall --id $packages[$i]
            break
        }
    }
}

function Install-Menu {
    while ($true) {
        Write-Host "`n----------------------"
        Write-Host "Enter (1) to install winget"
        Write-Host "Enter (2) to install essential software"
        Write-Host "Enter (3) to uninstall software"
        Write-Host "Enter (4) to exit"
        Write-Host "`n----------------------"

        $option = Read-Host "Enter option"


        if ($option -eq "1") {
            Install-Winget
        }
        elseif ($option -eq "2") {
            Install-Package -packages $packages
        }
        elseif ($option -eq "3") {
            Uninstall-Package -packages $packages
        }
        elseif ($option -eq "4") {
            exit
            
        }
        else {
            Write-Host "Invalid input. Try again!`n"
        }

    }
    
}
