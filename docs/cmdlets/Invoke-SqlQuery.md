# Invoke-SqlQuery

## Synopsis

Invokes an Sql Query.

## Syntax

### sqlcommand (Default)

```powershell
Invoke-SqlQuery [-SqlCommand] <SqlCommand> 
```

### textquery

```powershell
Invoke-SqlQuery [-PlainTextCommand] <String> [-SqlConnection <SqlConnection>] 
```

## Description

Takes either an SqlCommand or PlainTextCommand and Invokes the query against the desired SqlConnection.

## Examples

### Example 1

```
PS c:\> $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```


$Command = $Connection | New-SqlCommand -SqlCommand "INSERT INTO [dbo].[People] (Name) Values (@Name)"
$Command = $Command | Add-SqlCommandParameter -SqlParameterName "@Name" -SqlParameterType VarChar -SqlParameterValue "John Smith"
$Command | Invoke-SqlQuery

Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
Creates an SqlCommand to insert into the Name column of the [dbo].[People] Table.
Adds @Name Parameter with a type of VarChar and value of John Smith to $Command.
Invokes the Query adding the desired row to the [dbo].[People] Table.










### Example 2

```
PS c:\> $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```

$Connection | Invoke-SqlQuery -PlainTextCommand 'SELECT * FROM [dbo].[People]'

Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
Invokes the Query returning * from [dbo].[People] Tbale.










## Parameters

### -SqlCommand

SqlCommand Object to run against the desired SqlConnection.

```asciidoc
Type: SqlCommand
Parameter Sets: sqlcommand
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -PlainTextCommand

PlainText Sql Query.

```asciidoc
Type: String
Parameter Sets: textquery
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -SqlConnection

SqlConnection object used to make the query.

```asciidoc
Type: SqlConnection
Parameter Sets: textquery
Aliases: 

Required: false
Position: named
Default value: $Global:SqlConnection
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```


