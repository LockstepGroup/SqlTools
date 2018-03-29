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
        Note that these credentials will be available in plaintext in the returned string.
		
	#>
	[cmdletbinding(DefaultParameterSetName="not_integrated")]

	Param (
        [Parameter(Mandatory=$true,Position=0)]
        [string]$Server,

        [Parameter(Mandatory=$true,Position=1)]
        [string]$Database,

        [Parameter(Mandatory=$True,ParameterSetName="not_integrated",Position=2)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter(Mandatory=$true,ParameterSetName="integrated",Position=2)]
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
