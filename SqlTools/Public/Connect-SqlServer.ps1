function Connect-SqlServer {
    <#
	.SYNOPSIS
		Creates a Connection to an SQL Server.
		
	.DESCRIPTION
		Creates a Connection to an SQL server using either an existing SQL Connection String or Server/Database/Credentials.

    .EXAMPLE
        Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -UseWindowsAuthentication

        Connects to MyFavoriteDB on mysqlserver.example.com using integrated Windows authenticatin

    .EXAMPLE
        Connect-SqlServer -Server "mysqlserver.exampl.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        
        Prompts for Credentials and Connects to MyFavoriteDB on mysqlserver.example.com.

    .EXAMPLE
        New-SqlConnectionString -Server "mysqlserver.exampl.com" -Database "MyFavoriteDb" -Credential (Get-Credential) | Connect-SqlServer
        
        Prompts for Credentials and Creates Connection String for MyFavoriteDB on mysqlserver.example.com.
        Uses this Connection String to make the connection.
		
    .PARAMETER ConnectionString
        Existing Connection String to use for Connection.

    .PARAMETER Server
        IP address or Hostname of SQL Server.

    .PARAMETER Database
        Database to use for Connection.

    .PARAMETER Credential
        Credentials to use for Connection.

    .PARAMETER UseWindowsAuthentication
        Specifies that current Windows Credentials should be used for the Connection.
        Note that these credentials will be available in plaintext in the returned string.
		
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
