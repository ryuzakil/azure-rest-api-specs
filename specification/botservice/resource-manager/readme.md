# BotService

> see https://aka.ms/autorest

This is the AutoRest configuration file for BotService.

---

## Getting Started

To build the SDK for BotService, simply [Install AutoRest](https://aka.ms/autorest/install) and in this folder, run:

> `autorest`

To see additional help and options, run:

> `autorest --help`

---

## Configuration

### Basic Information

These are the global settings for the BotService API.

``` yaml
openapi-type: arm
tag: package-preview-2023-09
```


### Tag: package-preview-2023-09

These settings apply only when `--tag=package-preview-2023-09` is specified on the command line.

```yaml $(tag) == 'package-preview-2023-09'
input-file:
  - Microsoft.BotService/preview/2023-09-15-preview/botservice.json
directive:
  - suppress: R4009
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R4018
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R3016
    from: botservice.json
    reason: app settings keys are case sensitive
  - suppress: R3018
    from: botservice.json
    reason: app settings for ValidateAuthority needs to be boolean
```

### Tag: package-2022-09

These settings apply only when `--tag=package-2022-09` is specified on the command line.

```yaml $(tag) == 'package-2022-09'
input-file:
  - Microsoft.BotService/stable/2022-09-15/botservice.json
directive:
  - suppress: R4009
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R4018
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R3016
    from: botservice.json
    reason: app settings keys are case sensitive
  - suppress: R3018
    from: botservice.json
    reason: app settings for ValidateAuthority needs to be boolean
```
### Tag: package-preview-2022-06

These settings apply only when `--tag=package-preview-2022-06` is specified on the command line.

``` yaml $(tag) == 'package-preview-2022-06'
input-file:
  - Microsoft.BotService/preview/2022-06-15-preview/botservice.json
directive:
  - suppress: R4009
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R4018
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R3016
    from: botservice.json
    reason: app settings keys are case sensitive
  - suppress: R3018
    from: botservice.json
    reason: app settings for ValidateAuthority needs to be boolean
```

### Tag: package-preview-2021-05

These settings apply only when `--tag=package-preview-2021-05` is specified on the command line.

``` yaml $(tag) == 'package-preview-2021-05'
input-file:
  - Microsoft.BotService/preview/2021-05-01-preview/botservice.json
directive:
  - suppress: R4009
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R3016
    from: botservice.json
    reason: app settings keys are case sensitive
  - suppress: R3018
    from: botservice.json
    reason: app settings for ValidateAuthority needs to be boolean
```

### Tag: package-2021-03-01

These settings apply only when `--tag=package-2021-03-01` is specified on the command line.

``` yaml $(tag) == 'package-2021-03-01'
input-file:
- Microsoft.BotService/stable/2021-03-01/botservice.json
directive:
  - suppress: R4009
    from: botservice.json
    reason: We don not yet support systemdata
  - suppress: R3016
    from: botservice.json
    reason: app settings keys are case sensitive
  - suppress: R3018
    from: botservice.json
    reason: app settings for ValidateAuthority needs to be boolean
```

### Tag: package-2020-06-02

These settings apply only when `--tag=package-2020-06-02` is specified on the command line.

``` yaml $(tag) == 'package-2020-06-02'
input-file:
- Microsoft.BotService/stable/2020-06-02/botservice.json
directive:
  - suppress: R4009
    from: botservice.json
    reason: We do not yet support systemdata.
```

### Tag: package-2018-07-12

These settings apply only when `--tag=package-2018-07-12` is specified on the command line.

``` yaml $(tag) == 'package-2018-07-12'
input-file:
- Microsoft.BotService/preview/2018-07-12/botservice.json
directive:
  - suppress: R3010
    from: botservice.json
    reason: It is not a useful operation in the bot service.
  - suppress: R2001
    from: botservice.json
    reason: Flatten does not improve the programming experience here.
  - suppress: R3018
    from: botservice.json
    reason: We used Enums where we might extend to multiple states, and left booleans where it would ease development.
  - suppress: R2066
    from: botservice.json
    reason: The path as-is is quite descriptive.
```

### Tag: package-2017-12-01

These settings apply only when `--tag=package-2017-12-01` is specified on the command line.

``` yaml $(tag) == 'package-2017-12-01'
input-file:
- Microsoft.BotService/preview/2017-12-01/botservice.json
directive:
  - suppress: R3010
    from: botservice.json
    reason: It is not a useful operation in the bot service.
  - suppress: R2001
    from: botservice.json
    reason: Flatten does not improve the programming experience here.
  - suppress: R3018
    from: botservice.json
    reason: We used Enums where we might extend to multiple states, and left booleans where it would ease development.
  - suppress: R2066
    from: botservice.json
    reason: The path as-is is quite descriptive.
```

---

# Code Generation

## Swagger to SDK

This section describes what SDK should be generated by the automatic system.
This is not used by Autorest itself.

``` yaml $(swagger-to-sdk)
swagger-to-sdk:
  - repo: azure-sdk-for-net
  - repo: azure-sdk-for-python
  - repo: azure-sdk-for-python
  - repo: azure-sdk-for-go
  - repo: azure-resource-manager-schemas
  - repo: azure-sdk-for-js
  - repo: azure-powershell
```

## Suppression

``` 
directive:
  - suppress: SECRET_PROPERTY
    from: botservice.json
    where: $.definitions.FacebookChannelProperties.properties.verifyToken
    reason: We do need to return verifyToken in FacebookChannelProperties.
```

## C#

These settings apply only when `--csharp` is specified on the command line.
Please also specify `--csharp-sdks-folder=<path to "SDKs" directory of your azure-sdk-for-net clone>`.

``` yaml $(csharp)
csharp:
  azure-arm: true
  license-header: MICROSOFT_MIT_NO_VERSION
  namespace: Microsoft.Azure.Management.BotService
  output-folder: $(csharp-sdks-folder)/botservice/Microsoft.Azure.Management.BotService/src/Generated
  clear-output-folder: true
```

## Go

See configuration in [readme.go.md](./readme.go.md)

## Java

See configuration in [readme.java.md](./readme.java.md)

## Python

See configuration in [readme.python.md](./readme.python.md)
