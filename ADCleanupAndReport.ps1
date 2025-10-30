<#
.SYNOPSIS
Cleans up inactive AD users and computers, and generates a report.

.DESCRIPTION
Finds inactive users and computers (based on last logon date), disables them, and exports details to a report.
#>

param(
    [int]$DaysInactive = 120,
    [string]$OutputPath = "C:\Reports\ADCleanupReport.csv"
)

$ThresholdDate = (Get-Date).AddDays(-$DaysInactive)
$Report = @()

# Inactive Users
$InactiveUsers = Get-ADUser -Filter {LastLogonDate -lt $ThresholdDate -and Enabled -eq $true} -Properties LastLogonDate
foreach ($User in $InactiveUsers) {
    Disable-ADAccount -Identity $User.SamAccountName
    $Report += [PSCustomObject]@{
        ObjectType = "User"
        Name       = $User.SamAccountName
        LastLogon  = $User.LastLogonDate
        Action     = "Disabled"
    }
}

# Inactive Computers
$InactiveComputers = Get-ADComputer -Filter {LastLogonDate -lt $ThresholdDate -and Enabled -eq $true} -Properties LastLogonDate
foreach ($Comp in $InactiveComputers) {
    Disable-ADAccount -Identity $Comp.Name
    $Report += [PSCustomObject]@{
        ObjectType = "Computer"
        Name       = $Comp.Name
        LastLogon  = $Comp.LastLogonDate
        Action     = "Disabled"
    }
}

$Report | Export-Csv -Path $OutputPath -NoTypeInformation
Write-Host "AD cleanup completed. Report saved to $OutputPath"
