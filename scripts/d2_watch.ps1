param(
    [Parameter(Position = 0)]
    [string]$InputPath
)

if ([string]::IsNullOrWhiteSpace($InputPath)) {
    Write-Error "Usage: .\scripts\d2_watch.ps1 <input.d2>"
    exit 2
}

$inputFile = [System.IO.Path]::GetFullPath($InputPath)
$name = [System.IO.Path]::GetFileNameWithoutExtension($inputFile)
$outputFile = Join-Path (Join-Path $PSScriptRoot "..\\output") "$name.svg"

& d2 -w $inputFile $outputFile
exit $LASTEXITCODE
