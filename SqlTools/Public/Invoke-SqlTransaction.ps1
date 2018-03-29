function Invoke-SqlTransaction {
    <#
	.SYNOPSIS
		Commits an SqlTransaction.
		
    .DESCRIPTION
        Commits an SqlTransaction.

    .EXAMPLE

    .PARAMETER SqlTransaction
    SqlCommand Object to run against the desired SqlConnection.

    #>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlTransaction]$SqlTransaction
    )

    BEGIN {
        
    }

    PROCESS {
        $SqlTransaction.Commit()
    }
}
