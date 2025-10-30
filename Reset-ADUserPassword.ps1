<#
.SYNOPSIS
Resets AD user password and enables account.
#>

param(
    [Parameter(Mandatory = $true)] [string[]]$Usernames
)

$Password = Read-Host -AsSecureString "Enter new password"

foreach ($Username in $Usernames) {
    Set-ADAccountPassword -Identity $Username -NewPassword $Password -Reset
    Enable-ADAccount -Identity $Username
    Write-Host "Password reset for: $Username"
}
