# 🧠 Active Directory PowerShell Automation Scripts

This repository contains practical **PowerShell scripts** for automating and maintaining **Active Directory (AD)** environments.  
They’re designed for system administrators who want to simplify daily tasks, improve security, and maintain cleaner AD structures.

---

## 📜 Scripts Included

| Script | Description |
|--------|--------------|
| **Create-ADUser.ps1** | Creates a single user account and adds it to a group. |
| **Bulk-Create-ADUsers.ps1** | Imports and creates multiple users from a CSV file. |
| **Disable-InactiveADUsers.ps1** | Disables user accounts inactive for a defined number of days. |
| **Get-ADUserReport.ps1** | Generates a CSV report of all AD users, their status, and last logon date. |
| **Reset-ADUserPassword.ps1** | Resets passwords and re-enables selected user accounts. |
| **ADGroupMembershipAudit.ps1** | Exports all AD groups and their members for auditing purposes. |
| **ADCleanupAndReport.ps1** | Automatically disables inactive user/computer accounts and logs results to a report. |

---

## ⚙️ Requirements

- Windows Server or Windows 10/11 with **Active Directory PowerShell Module** installed.  
- Run scripts in **PowerShell as Administrator**.  
- Sufficient **permissions** to create, modify, or disable AD objects.  

To install the AD module (if not already available):

```powershell
Add-WindowsFeature RSAT-AD-PowerShell
