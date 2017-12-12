<#
.SYNOPSIS
This script will retrieve the OU of a computer

.DESCRIPTION
This script will retrieve the OU based on the name of a computer that is specified.  The ActiveDirectory module is required.

.EXAMPLE
./get-ou -computername ph210lab01

.NOTES
This is version 1.0
#>
Function Get-OU{
    [CmdletBinding()]
    Param(      
        [Parameter(Mandatory=$true)]
        [String]$ComputerName
    )

    #Find computer
    $DN = Get-ADComputer $ComputerName -Properties DistinguishedName
    #Turn AD object into string
    $OU = $DN.DistinguishedName
    #Find the start of the OU path
    $FirstComma = $OU.IndexOf(",")
    #Remove the computer name and first comma
    $OU.Substring($FirstComma+1,$OU.Length-$FirstComma-1)
}
