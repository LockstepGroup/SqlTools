# Get-SqlSchemaInfo

## Synopsis

Get Schema info from an SQL Database.

## Syntax

### tablecolumns

```powershell
Get-SqlSchemaInfo [-SqlConnection] <SqlConnection> -Table <String[]> -Column <String[]> 
```

### tableonly

```powershell
Get-SqlSchemaInfo [-SqlConnection] <SqlConnection> -Table <String[]> 
```

## Description

Get Schema info from an SQL Database.

## Examples

### Example 1

```
PS c:\> $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```


Get-SqlSchemaInfo -Table *

Returns all tables in a database










## Parameters

### -SqlConnection

SQL Connection to run the Command against.

```asciidoc
Type: SqlConnection
Parameter Sets: All
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -Table


```asciidoc
Type: String[]
Parameter Sets: All
Aliases: 

Required: true
Position: named
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```
### -Column


```asciidoc
Type: String[]
Parameter Sets: tablecolumns
Aliases: 

Required: true
Position: named
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```


