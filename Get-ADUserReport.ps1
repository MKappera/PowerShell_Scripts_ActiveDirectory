<#
.SYNOPSIS
Exports an AD user report to CSV.
#>

param(
    [string]$OutputPath = "C:\Reports\ADUserReport.csv"
)

$Users = Get-ADUser -Filter * -Properties DisplayName, EmailAddress, Department, Enabled, LastLogonDate

$Users | Select-Object DisplayName, SamAccountName, EmailAddress, Department, Enabled, LastLogonDate |
Export-Csv -Path $OutputPath -NoTypeInformation

Write-Host "Report generated: $OutputPath"
