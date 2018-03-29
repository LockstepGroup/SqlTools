function Add-SqlCommandParameter {
    <#
	.SYNOPSIS
		Adds a Paramaterized Value to an Sql Command
		
    .DESCRIPTION
        Creates a Command to execute against an existing SQL Connection.

    .EXAMPLE

    .PARAMETER SqlCommand

    .PARAMETER SqlParameterName

    .PARAMETER SqlParameterType

    .PARAMETER SqlParameterValue
		
	#>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlCommand]$SqlCommand,

        [Parameter(Mandatory=$true,Position=1)]
        [alias('Name')]
        [string]$SqlParameterName,

        # Needs validation
        [Parameter(Mandatory=$true,Position=2)]
        [alias('Type')]
        [System.Data.SqlDbType]$SqlParameterType = [System.Enum]::GetValues([System.Data.SqlDbType]),

        [Parameter(Mandatory=$true,Position=3)]
        [alias('Value')]
        [string]$SqlParameterValue
    )

    BEGIN {
        

    }

    PROCESS {

        $Command = $SqlCommand.Parameters.Add($SqlParameterName,$SqlParameterType)
        $Command = $SqlCommand.Parameters[$SqlParameterName].Value = $SqlParameterValue
        $Command
    }
}
