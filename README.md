# Active Directory PowerShell Automation Scripts

This repository contains practical PowerShell scripts for automating common Active Directory administrative tasks.

## Scripts Included
| Script | Description |
|--------|--------------|
| **Create-ADUser.ps1** | Creates a single user account and adds to group. |
| **Bulk-Create-ADUsers.ps1** | Imports users from a CSV file. |
| **Disable-InactiveADUsers.ps1** | Disables accounts inactive for a defined period. |
| **Get-ADUserReport.ps1** | Exports user data and account status to CSV. |
| **Reset-ADUserPassword.ps1** | Resets passwords and re-enables accounts. |

## Requirements
- Windows Server with **Active Directory PowerShell Module**.
- Run scripts in **PowerShell as Administrator**.
- Proper **permissions** to create or modify AD objects.

## Example Usage
```powershell
# Create a single user
.\Create-ADUser.ps1 -FirstName John -LastName Doe -Username jdoe -OU "OU=Users,DC=domain,DC=local" -Group "IT"

# Bulk create users
.\Bulk-Create-ADUsers.ps1 -CSVPath "C:\users.csv"
