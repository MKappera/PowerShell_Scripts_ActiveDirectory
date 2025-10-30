<#
.SYNOPSIS
Disables inactive AD users based on last logon date.
#>

param (
    [int]$DaysInactive = 90
)

$DateThreshold = (Get-Date).AddDays(-$DaysInactive)

$InactiveUsers = Get-ADUser -Filter {LastLogonDate -lt $DateThreshold -and Enabled -eq $true} -Properties LastLogonDate

foreach ($User in $InactiveUsers) {
    Disable-ADAccount -Identity $User.SamAccountName
    Write-Host "Disabled inactive user: $($User.SamAccountName) - Last Logon: $($User.LastLogonDate)"
}
