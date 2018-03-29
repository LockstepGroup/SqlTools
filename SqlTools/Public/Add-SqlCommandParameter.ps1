function Add-SqlCommandParameter {
    <#
	.SYNOPSIS
		Adds a Paramaterized Value to an Sql Command.
		
    .DESCRIPTION
        Takes an existing SqlCommand Object and adds Parameters with Values.

    .EXAMPLE
        $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
        $Command = $Connection | New-SqlCommand -SqlCommand "INSERT INTO [dbo].[People] (Name) Values (@Name)"
        $Command = $Command | Add-SqlCommandParameter -SqlParameterName "@Name" -SqlParameterType VarChar -SqlParameterValue "John Smith"

        Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
        Creates an SqlCommand to insert into the Name column of the [dbo].[People] Table.
        Adds @Name Parameter with a type of VarChar and value of John Smith to $Command

    .PARAMETER SqlCommand
    SqlCommand Object to add Parameter to.

    .PARAMETER SqlParameterName
    Name of the Sql Parameter you wish to set, ie: @DesiredParametereName.

    .PARAMETER SqlParameterType
    Type of the Sql Parameter you wish to set, ie: VarChar.

    .PARAMETER SqlParameterValue
    Value of the Sql Parameter you wish to set.
		
	#>
	[cmdletbinding()]

	Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$True,Position=0)]
        [System.Data.SqlClient.SqlCommand]$SqlCommand,

        [Parameter(Mandatory=$true,Position=1)]
        [alias('Name')]
        [string]$SqlParameterName,

        # Needs validation
        [Parameter(Mandatory=$true,Position=2)]
        [alias('Type')]
        [System.Data.SqlDbType]$SqlParameterType = [System.Enum]::GetValues([System.Data.SqlDbType]),

        [Parameter(Mandatory=$true,Position=3)]
        [alias('Value')]
        [string]$SqlParameterValue
    )

    BEGIN {
        

    }

    PROCESS {
        $SqlCommand.Parameters.Add($SqlParameterName,$SqlParameterType) | Out-Null
        $SqlCommand.Parameters[$SqlParameterName].Value = $SqlParameterValue
    }
}
