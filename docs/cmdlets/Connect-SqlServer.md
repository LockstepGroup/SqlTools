# Connect-SqlServer

## Synopsis

Creates a Connection to an SQL Server.

## Syntax

### connstring (Default)

```powershell
Connect-SqlServer [-ConnectionString] <String> [-ApplicationIntentRO] 
```

### integrated

```powershell
Connect-SqlServer [-Server] <String> [-Database] <String> [-UseWindowsAuthentication] [-ApplicationIntentRO] 
```

### not_integrated

```powershell
Connect-SqlServer [-Server] <String> [-Database] <String> [-Credential] <PSCredential> [-ApplicationIntentRO] 
```

## Description

Creates a Connection to an SQL server using either an existing SQL Connection String or Server/Database/Credentials.

## Examples

### Example 1

```
PS c:\> Connect-SqlServer -Server "mysqlserver.example.com" -Database "MyFavoriteDb" -UseWindowsAuthentication
```


Connects to MyFavoriteDB on mysqlserver.example.com using integrated Windows authenticatin










### Example 2

```
PS c:\> Connect-SqlServer -Server "mysqlserver.exampl.com" -Database "MyFavoriteDb" -Credential (Get-Credential)
```

Prompts for Credentials and Connects to MyFavoriteDB on mysqlserver.example.com.










### Example 3

```
PS c:\> New-SqlConnectionString -Server "mysqlserver.exampl.com" -Database "MyFavoriteDb" -Credential (Get-Credential) | Connect-SqlServer
```

Prompts for Credentials and Creates Connection String for MyFavoriteDB on mysqlserver.example.com.
Uses this Connection String to make the connection.










## Parameters

### -ConnectionString

Existing Connection String to use for Connection.

```asciidoc
Type: String
Parameter Sets: connstring
Aliases: 

Required: true
Position: 1
Default value: 
Accept pipeline input: true (ByValue)
Accept wildcard characters: false
```
### -Server

IP address or Hostname of SQL Server.

```asciidoc
Type: String
Parameter Sets: integrated, not_integrated
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
Parameter Sets: integrated, not_integrated
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
### -ApplicationIntentRO


```asciidoc
Type: SwitchParameter
Parameter Sets: All
Aliases: 

Required: false
Position: named
Default value: False
Accept pipeline input: false
Accept wildcard characters: false
```


