$packages = @("Microsoft.Office", "GlavSoft.TightVNC", "Adobe.Acrobat.Reader.64-bit", "Google.Chrome")


function IsInstall-Winget {
    
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
    Write-Host "Select app you want to uninstall"
    for ($i = 0; $i -lt $packages.Count; $i++) {
        Write-Host "$($i + 1). $($packages[$i])"
    }

    $option = Read-Host "Select"

    for ($i = 0; $i -lt $array.Count; $i++) {
        if($option -eq "$($i + 1)"){
            winget uninstall -e $packages[$($i + 1)] -h
        }
    }
    





}

Uninstall-Package -packages $packages