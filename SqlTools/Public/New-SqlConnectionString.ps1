function New-SqlConnectionString {
	<#
	.SYNOPSIS
		Creates a valid SQL Connection String.
		
	.DESCRIPTION
		Generates an SQL Connection String using either integrated or non-integrated authentication.

    .EXAMPLE
        New-SqlConnectionString -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -UseWindowsAuthentication

        Connects to MyFavoriteDB on mysqlserver.example.com using integrated Windows authenticatin

    .EXAMPLE
        New-SqlConnectionString -Server "mysqlserver.exampl.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        
        Prompts for Credentials and connects to MyFavoriteDB on mysqlserver.example.com.
		
    .PARAMETER Server
        IP address or Hostname of SQL Server.

    .PARAMETER Database
        Database to use for Connection.

    .PARAMETER Credential
        Credentials to use for Connection.

    .PARAMETER UseWindowsAuthentication
        Specifies that current Windows Credentials should be used for the Connection.
		
	#>
	[cmdletbinding(DefaultParameterSetName="not_integrated")]

	Param (
        [Parameter(Mandatory=$true)]
        [Alias("Serverinstance")]
        [string]$Server,

        [Parameter(Mandatory=$true)]
        [string]$Database,

        [Parameter(Mandatory=$True,ParameterSetName="not_integrated")]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter(Mandatory=$true,ParameterSetName="integrated")]
        [switch]$UseWindowsAuthentication
    )

    $ConnectionString = "Server=$Server; Database=$Database; "

    switch ($PSCmdlet.ParameterSetName) {
        'not_integrated' {
            $ConnectionString += "User ID=$($Credential.UserName); Password=$($Credential.getnetworkcredential().password);"
            continue
        }
        'integrated' {
            $ConnectionString += "Trusted_Connection=Yes; Integrated Security=SSPI;"
            continue
        }
    }

    $ConnectionString
}
