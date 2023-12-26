# PowerShell Software Management Script



## Overview

This PowerShell script offers a user-friendly interface for managing software installations on Windows systems.
It utilizes the `winget` command-line tool for installing, uninstalling, and managing a variety of packages. 

## Feature

- **Install winget**: Usually `winget` has been installed on Windows PC. This function will check either if the PC installed `winget` or install it.
- **Install software package**: Modify `$packages` array to include or exclude the software as per your requirement. Visit [Winget.run](https://winget.run/) to find your package.
- **Uninstall software**: This option will list out the software has been installed by using this script. Type select the `number` to uninstall the software.


## Prerequisites

- Operating System: Windows 10 or newer
- PowerShell Version: 5.1 or higher
- Required: Active internet connection
- Administrator Privilage

## Initialize
Run PowerShell as Adminitrator

Move to the script directory

```powershell
Set-Location -path "<script path>"
```
Run the script
```powershell
.\Install-Software.ps1

```

## Customization
Modify the `$packages` array to include or exclude the software as per your requirement.

## Troubleshooting
- Ensure run the PowerShell as Administrator.
- Verify that `winget` is installed on your PC.




