# New-SqlTransaction

## Synopsis

Creates an Sql Transaction.

## Syntax


```powershell
New-SqlTransaction [-SqlConnection <SqlConnection>] [-Name] <String> 
```

## Description

Creates an Sql Transaction that can be used to run multiple queries as one transaction.

## Examples

### Example 1

```
PS c:\> $Connection = Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```


$Connection | New-SqlTransaction -Name "MyTransaction"

Connects to MyFavoriteDb on mysqlserver.example.com (prompting for credentials).
Creates an Sql Transaction named "MyTransaction".










## Parameters

### -SqlConnection

SqlConnection object used to make the Transaction.

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
### -Name

Name of the Transaction.

```asciidoc
Type: String
Parameter Sets: All
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```


