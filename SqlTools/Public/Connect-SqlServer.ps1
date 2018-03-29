function Connect-SqlServer {
    <#
	.SYNOPSIS
		Creates a Connection to an SQL Server.
		
	.DESCRIPTION
		Creates a Connection to an SQL server using either an existing SQL Connection String or Server/Database/Credentials.

    .EXAMPLE

    .PARAMETER Server
		
	#>
	[cmdletbinding(DefaultParameterSetName="connstring")]

	Param (
        [Parameter(Mandatory=$true,ParameterSetName="connstring",ValueFromPipeline=$True,Position=0)]
        [string]$ConnectionString,

        [Parameter(Mandatory=$true,ParameterSetName="not_integrated",Position=0)]
        [Parameter(Mandatory=$true,ParameterSetName="integrated",Position=0)]
        [string]$Server,

        [Parameter(Mandatory=$true,ParameterSetName="not_integrated",Position=1)]
        [Parameter(Mandatory=$true,ParameterSetName="integrated",Position=1)]
        [string]$Database,

        [Parameter(Mandatory=$True,ParameterSetName="not_integrated",Position=2)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter(Mandatory=$true,ParameterSetName="integrated",Position=2)]
        [switch]$UseWindowsAuthentication
    )

    BEGIN {

    }

    PROCESS {
        switch ($PSCmdlet.ParameterSetName) {
            { $_ -ne 'connstring' } {
                $ConnectionString = New-SqlConnectionString @PSBoundParameters
                continue
            }
        }

        $Connection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString
        $Connection.open()
        $Connection
    }
}
