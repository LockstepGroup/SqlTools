function Get-SqlSchemaInfo {
    <#
	.SYNOPSIS
		Get Schema info from an SQL Database.
		
    .DESCRIPTION
        Get Schema info from an SQL Database.

    .EXAMPLE
        $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        Get-SqlSchemaInfo -Table *
        
        Returns all tables in a database

    .PARAMETER SqlConnection
    SQL Connection to run the Command against.
		
	#>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlConnection]$SqlConnection,

        [Parameter(Mandatory=$true,ParameterSetName="tableonly")]
        [Parameter(Mandatory=$true,ParameterSetName="tablecolumns")]
        [string[]]$Table,

        [Parameter(Mandatory=$true,ParameterSetName="tablecolumns")]
        [string[]]$Column
    )

    BEGIN {
        function MakeArrayIntoSql ([string[]]$Array,[string]$Column) {
            $Query = "("
            $i = 0
            foreach ($a in $Array) {
                $i++
                if ($i -eq 1) {
                    $Query += " $Column = '$a'"
                } else {
                    $Query += " OR $Column = '$a'"
                }
            }
            $Query += ")"
            $Query
        }

    }

    PROCESS {
        switch ($PSCmdlet.ParameterSetName) {
            'tableonly' {
                $Query = "SELECT * FROM INFORMATION_SCHEMA.TABLES"
                if ($Table -ne '*') {
                    $Query += " WHERE "
                    $Query += MakeArrayIntoSql $Table 'TABLE_NAME'
                }
                continue
            }
            'tablecolumns' {
                $Query = 'SELECT * FROM INFORMATION_SCHEMA.COLUMNS'

                if (($Table -ne '*') -or ($Column -ne '*')) {
                    $Query += ' WHERE '
                }

                if ($Table -ne '*') {
                    $Query += MakeArrayIntoSql $Table 'TABLE_NAME'
                    if ($Column -ne '*') {
                        $Query += ' AND '
                    }
                }

                if ($Column -ne '*') {
                    $Query += MakeArrayIntoSql $Column 'COLUMN_NAME'
                }
                continue
            }
        }

        Write-Verbose "Query $Query"

        $Results = Invoke-SqlQuery -PlainTextCommand $Query -SqlConnection $SqlConnection

        $Results
    }
}
