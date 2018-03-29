# New-SqlConnectionString

## Synopsis

Creates a valid SQL Connection String.

## Syntax

### not_integrated (Default)

```powershell
New-SqlConnectionString [-Server] <String> [-Database] <String> [-Credential] <PSCredential> 
```

### integrated

```powershell
New-SqlConnectionString [-Server] <String> [-Database] <String> [-UseWindowsAuthentication] 
```

## Description

Generates an SQL Connection String using either integrated or non-integrated authentication.

## Examples

### Example 1

```
PS c:\> New-SqlConnectionString -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -UseWindowsAuthentication
```


Creates Connection String for to MyFavoriteDB on mysqlserver.example.com using integrated Windows authenticatin










### Example 2

```
PS c:\> New-SqlConnectionString -Server "mysqlserver.exampl.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```

Prompts for Credentials and Creates Connection String for MyFavoriteDB on mysqlserver.example.com.










## Parameters

### -Server

IP address or Hostname of SQL Server.

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
### -Database

Database to use for Connection.

```asciidoc
Type: String
Parameter Sets: All
Aliases: 

Required: true
Position: 2
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```
### -Credential

Credentials to use for Connection.

```asciidoc
Type: PSCredential
Parameter Sets: not_integrated
Aliases: 

Required: true
Position: 3
Default value: 
Accept pipeline input: false
Accept wildcard characters: false
```
### -UseWindowsAuthentication

Specifies that current Windows Credentials should be used for the Connection.
Note that these credentials will be available in plaintext in the returned string.

```asciidoc
Type: SwitchParameter
Parameter Sets: integrated
Aliases: 

Required: true
Position: 3
Default value: False
Accept pipeline input: false
Accept wildcard characters: false
```


