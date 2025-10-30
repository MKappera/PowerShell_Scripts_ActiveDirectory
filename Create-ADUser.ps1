<#
.SYNOPSIS
Creates a new AD user and adds to a specified group.

.DESCRIPTION
This script creates a user account in a specific OU and assigns initial attributes.
It can also add the user to one or more AD groups.

#>

param(
    [Parameter(Mandatory = $true)] [string]$FirstName,
    [Parameter(Mandatory = $true)] [string]$LastName,
    [Parameter(Mandatory = $true)] [string]$Username,
    [Parameter(Mandatory = $true)] [string]$OU,
    [string]$Group = ""
)

$Password = Read-Host -AsSecureString "Enter password for new user"

$UserPrincipalName = "$Username@domain.local"
$DisplayName = "$FirstName $LastName"

New-ADUser `
    -GivenName $FirstName `
    -Surname $LastName `
    -Name $DisplayName `
    -SamAccountName $Username `
    -UserPrincipalName $UserPrincipalName `
    -AccountPassword $Password `
    -Path $OU `
    -Enabled $true `
    -ChangePasswordAtLogon $true

if ($Group) {
    Add-ADGroupMember -Identity $Group -Members $Username
    Write-Host "Added $Username to $Group"
}

Write-Host "User $DisplayName created successfully."
