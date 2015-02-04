# halt immediately on any errors which occur in this module
$ErrorActionPreference = "Stop"

function EnsureNuGetCommandLineInstalled(){
    # install nuget-commandline
    try{
        Get-Command nuget -ErrorAction Stop | Out-Null
    }
    catch{             
        cinst 'nuget.commandline'
    }    
}

function Invoke-CIStep(
[string[]][Parameter(Mandatory=$true, ValueFromPipelineByPropertyName = $true)]$CsprojAndOrNuspecFilePaths,
[string][Parameter(ValueFromPipelineByPropertyName = $true)]$OutputDirectoryPath){
    EnsureNuGetCommandLineInstalled
    
    foreach($csprojOrNuspecFilePath in $CsprojAndOrNuspecFilePaths)
    {        
        # invoke nuget pack
        nuget pack (resolve-path $csprojOrNuspecFilePath) `
        -Symbols `
        -OutputDirectory (resolve-path $OutputDirectoryPath)

        # handle errors
        if ($LastExitCode -ne 0) {
            throw $Error
        }
    }

}

Export-ModuleMember -Function Invoke-CIStep
