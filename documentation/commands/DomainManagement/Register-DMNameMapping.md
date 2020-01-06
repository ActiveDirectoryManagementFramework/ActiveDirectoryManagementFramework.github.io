---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMNameMapping

## SYNOPSIS
Register a new name mapping.

## SYNTAX

```
Register-DMNameMapping [-Name] <String> [-Value] <String> [<CommonParameters>]
```

## DESCRIPTION
Register a new name mapping.
Mapped names are used for stringr replacement when invoking domain configurations.

## EXAMPLES

### EXAMPLE 1
```
Register-DMNameMapping -Name '%ManagementGroup%' -Value 'Mgmt-Team-1234'
```

Registers the string 'Mgmt-Team-1234' under the label '%ManagementGroup%'

## PARAMETERS

### -Name
The name of the placeholder to register.
This label will be replaced with the content specified in -Value.
Be aware that all labels must be enclosed in % and only contain letters, underscore and numbers.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Value
The value to insert in place of the label.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
