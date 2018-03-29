function New-SqlCommand {
    <#
	.SYNOPSIS
		Creates an SQL Command object.
		
    .DESCRIPTION
        Creates a Command to execute against an existing SQL Connection.

    .EXAMPLE
        $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        $Command = $Connection | New-SqlCommand -SqlCommand "SELECT * FROM sys.databases"
        
        Selects * from sys.databases in MyFavoriteDb on mysqlserver.example.com

    .PARAMETER SqlCommand
    SQL Command you wish to run.

    .PARAMETER SqlConnection
    SQL Connection to run the Command against.
		
	#>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [string]$SqlCommand,

        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=1)]
        [System.Data.SqlClient.SqlConnection]$SqlConnection,

        [Parameter(Mandatory=$false)]
        [System.Data.SqlClient.SqlTransaction]$SqlTransaction
    )

    BEGIN {

    }

    PROCESS {
        $Command = New-Object System.Data.SqlClient.SqlCommand($SqlCommand,$SqlConnection)
        if ($SqlTransaction) {
            $Command.Transaction = $SqlTransaction
        }
        $Command
    }
}
