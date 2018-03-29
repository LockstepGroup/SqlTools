function New-SqlTransaction {
    <#
	.SYNOPSIS
		Creates an Sql Transaction.
		
    .DESCRIPTION
        Creates an Sql Transaction that can be used to run multiple queries as one transaction.

    .EXAMPLE
        $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        $Connection | New-SqlTransaction -Name "MyTransaction"

        Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
        Creates an Sql Transaction named "MyTransaction".

    .PARAMETER SqlConnection
        SqlConnection object used to make the Transaction.

    .PARAMETER Name
        Name of the Transaction.

	#>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlConnection]$SqlConnection,

        [Parameter(Mandatory=$true,Position=1)]
        [string]$Name        
    )

    BEGIN {

    }

    PROCESS {
        $SqlConnection.BeginTransaction($Name)
    }
}
