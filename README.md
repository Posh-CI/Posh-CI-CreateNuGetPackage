####What is it?

A [PoshDevOps](https://github.com/PoshDevOps/PoshDevOps) task that creates one or more [NuGet](http://www.nuget.org/) packages

####How do I install it?

```PowerShell
Add-PoshDevOpsTask -Name "YOUR-TASK-NAME" -PackageId "CreateNuGetPackage"
```

####What parameters are available?

#####IncludeCsprojAndOrNuspecPath
A String[] representing included .nuspec and/or .csproj file paths. Either literal or wildcard paths are allowed; default is all .nuspec 
files within your project root dir @ any depth unless .csproj files found by same name in which case .csproj will be used
```PowerShell
[String[]]
[ValidateCount(1,[Int]::MaxValue)]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$IncludeCsprojAndOrNuspecPath = @(gci -Path $PoshDevOpsProjectRootDirPath -File -Filter '*.nuspec' -Recurse | %{$_.FullName})
```

#####ExcludeCsprojAndOrNuspecPath
A String[] representing .csproj and/or .nuspec file names to exclude. Either literal or wildcard names are supported.
```PowerShell
[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ExcludeCsprojAndOrNuspecPath
```

#####Recurse
A Switch representing whether to recursively search directories below $IncludeCsprojAndOrNuspecPath.
```PowerShell
[Switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Recurse
```

#####PreferNuspec
A Switch representing whether to prefer .nuspec files over project files(.csproj,.vbproj..etc.); default is to prefer project files with the same base name as .nuspec files (when they exist).
```PowerShell
[Switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$PreferNuspec
```

#####OutputDirectoryPath
A String representing the output directory to pass to `nuget.exe pack`
```PowerShell
[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$OutputDirectoryPath
```
#####Version
A String representing the version of the package
```PowerShell
[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Version='0.0.1'
```
#####IncludeSymbols
A Switch representing whether debug symbols should included in the package
```PowerShell
[Switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)
$IncludeSymbols]
```

####What's the build status?
![](https://ci.appveyor.com/api/projects/status/rayv6xsibmqf48e8?svg=true)

