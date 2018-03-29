# Add-SqlCommandParameter

## Synopsis

Adds a Paramaterized Value to an Sql Command.

## Syntax


```powershell
Add-SqlCommandParameter [-SqlCommand] <SqlCommand> [-SqlParameterName] <String> [-SqlParameterType] [-SqlParameterValue] <String> 
```

## Description

Takes an existing SqlCommand Object and adds Parameters with Values.

## Examples

### Example 1

```
PS c:\> $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```


$Command = $Connection | New-SqlCommand -SqlCommand "INSERT INTO [dbo].[People] (Name) Values (@Name)"
$Command = $Command | Add-SqlCommandParameter -SqlParameterName "@Name" -SqlParameterType VarChar -SqlParameterValue "John Smith"

Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
Creates an SqlCommand to insert into the Name column of the [dbo].[People] Table.
Adds @Name Parameter with a type of VarChar and value of John Smith to $Command










## Parameters

### -SqlCommand

SqlCommand Object to add Parameter to.

```asciidoc
Type: SqlCommand
Parameter Sets: All
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -SqlParameterName

Name of the Sql Parameter you wish to set, ie: @DesiredParametereName.

```asciidoc
Type: String
Parameter Sets: All
Aliases: Name

Required: true
Position: 2
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```
### -SqlParameterType

Type of the Sql Parameter you wish to set, ie: VarChar.

```asciidoc
Type: SqlDbType
Parameter Sets: All
Aliases: Type

Required: true
Position: 3
Default value: [System.Enum]::GetValues([System.Data.SqlDbType])
Accept pipeline input: false
Accept wildcard characters: false
```
### -SqlParameterValue

Value of the Sql Parameter you wish to set.

```asciidoc
Type: String
Parameter Sets: All
Aliases: Value

Required: true
Position: 4
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```


