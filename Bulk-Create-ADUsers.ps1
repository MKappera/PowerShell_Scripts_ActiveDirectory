CSV
FirstName,LastName,Username,OU,Group
John,Doe,jdoe,"OU=Users,DC=domain,DC=local","IT"
Jane,Smith,jsmith,"OU=Users,DC=domain,DC=local","HR"

Powewrshell

<#
.SYNOPSIS
Creates multiple AD users from a CSV file.

.PARAMETER CSVPath
Path to the CSV file containing user details.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$CSVPath
)

Import-Csv $CSVPath | ForEach-Object {
    $Password = ConvertTo-SecureString "Welcome@123" -AsPlainText -Force

    New-ADUser `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -Name "$($_.FirstName) $($_.LastName)" `
        -SamAccountName $_.Username `
        -UserPrincipalName "$($_.Username)@domain.local" `
        -AccountPassword $Password `
        -Path $_.OU `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    if ($_.Group) {
        Add-ADGroupMember -Identity $_.Group -Members $_.Username
    }

    Write-Host "Created user: $($_.Username)"
}

