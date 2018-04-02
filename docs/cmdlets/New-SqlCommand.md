# New-SqlCommand

## Synopsis

Creates an SQL Command object.

## Syntax


```powershell
New-SqlCommand [-SqlCommand] <String> [-SqlConnection <SqlConnection>] [-SqlTransaction <SqlTransaction>] 
```

## Description

Creates a Command to execute against an existing SQL Connection.

## Examples

### Example 1

```
PS c:\> $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```


$Command = $Connection | New-SqlCommand -SqlCommand "SELECT * FROM sys.databases"

Selects * from sys.databases in MyFavoriteDb on mysqlserver.example.com










## Parameters

### -SqlCommand

SQL Command you wish to run.

```asciidoc
Type: String
Parameter Sets: All
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -SqlConnection

SQL Connection to run the Command against.

```asciidoc
Type: SqlConnection
Parameter Sets: All
Aliases: 

Required: false
Position: named
Default value: $Global:SqlConnection
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -SqlTransaction


```asciidoc
Type: SqlTransaction
Parameter Sets: All
Aliases: 

Required: false
Position: named
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```


