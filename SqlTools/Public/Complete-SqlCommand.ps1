function Complete-SqlCommand {
    <#
	.SYNOPSIS
		Completes or Commits an SqlCommand to an SqlTransaction.
		
    .DESCRIPTION
        Completes or Commits an SqlCommand to an SqlTransaction.

    .EXAMPLE
        
    .PARAMETER SqlCommand
    SqlCommand Object to add Parameter to.

	#>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlCommand]$SqlCommand
    )

    BEGIN {
        

    }

    PROCESS {
        # At some point we'll need to handle other types of queries, but for now I know we have
        # INSERT and UPDATE
        try {
            $SqlCommand.ExecuteNonQuery()
        } catch {
            Throw $_
        }
        
    }
}
