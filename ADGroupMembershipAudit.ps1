<#
.SYNOPSIS
Generates an Active Directory group membership report.

.DESCRIPTION
Exports all AD groups and their members to a CSV file for auditing and compliance checks.
#>

param(
    [string]$OutputPath = "C:\Reports\ADGroupMembershipReport.csv"
)

Write-Host "Generating AD group membership report... Please wait."

$Report = @()

$Groups = Get-ADGroup -Filter * | Sort-Object Name

foreach ($Group in $Groups) {
    $Members = Get-ADGroupMember -Identity $Group.Name -ErrorAction SilentlyContinue
    if ($Members) {
        foreach ($Member in $Members) {
            $Report += [PSCustomObject]@{
                GroupName  = $Group.Name
                MemberName = $Member.Name
                MemberType = $Member.ObjectClass
            }
        }
    }
}

$Report | Export-Csv -Path $OutputPath -NoTypeInformation
Write-Host "Report generated successfully at $OutputPath"
