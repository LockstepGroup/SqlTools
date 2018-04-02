function Invoke-SqlQuery {
    <#
	.SYNOPSIS
		Invokes an Sql Query.
		
    .DESCRIPTION
        Takes either an SqlCommand or PlainTextCommand and Invokes the query against the desired SqlConnection.

    .EXAMPLE
        $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        $Command = $Connection | New-SqlCommand -SqlCommand "INSERT INTO [dbo].[People] (Name) Values (@Name)"
        $Command = $Command | Add-SqlCommandParameter -SqlParameterName "@Name" -SqlParameterType VarChar -SqlParameterValue "John Smith"
        $Command | Invoke-SqlQuery

        Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
        Creates an SqlCommand to insert into the Name column of the [dbo].[People] Table.
        Adds @Name Parameter with a type of VarChar and value of John Smith to $Command.
        Invokes the Query adding the desired row to the [dbo].[People] Table.

    .EXAMPLE
        $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        $Connection | Invoke-SqlQuery -PlainTextCommand 'SELECT * FROM [dbo].[People]'

        Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
        Invokes the Query returning * from [dbo].[People] Tbale.

    .PARAMETER SqlCommand
    SqlCommand Object to run against the desired SqlConnection.

    .PARAMETER PlainTextCommand
    PlainText Sql Query.

    .PARAMETER SqlConnection
    SqlConnection object used to make the query.
		
	#>
	[cmdletbinding(DefaultParameterSetName="sqlcommand")]

	Param (
        [Parameter(Mandatory=$true,ParameterSetName="sqlcommand",ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlCommand]$SqlCommand,

        [Parameter(Mandatory=$true,ParameterSetName="textquery",ValueFromPipeline=$True,Position=0)]
        [string]$PlainTextCommand,

        [Parameter(Mandatory=$False,ParameterSetName="textquery",ValueFromPipeline=$True)]
        [System.Data.SqlClient.SqlConnection]$SqlConnection = $Global:SqlConnection
    )

    BEGIN {
        
    }

    PROCESS {
        switch ($PSCmdlet.ParameterSetName) {
            'textquery' {
                Write-Verbose "PlainText Query: $PlainTextCommand"
                $SqlCommand = $SqlConnection | New-SqlCommand -SqlCommand $PlainTextCommand
                continue
            }
        }


        $Dataset     = New-Object System.Data.DataSet
        $DataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter($SqlCommand)
        $DataAdapter.Fill($Dataset) | Out-Null

        return $Dataset
    }
}
