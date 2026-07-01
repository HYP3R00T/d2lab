param(
    [Parameter(Position = 0)]
    [string]$InputPath
)

if ([string]::IsNullOrWhiteSpace($InputPath)) {
    Write-Error "Usage: .\scripts\d2_build.ps1 <input.d2>"
    exit 2
}

$inputFile = [System.IO.Path]::GetFullPath($InputPath)
$name = [System.IO.Path]::GetFileNameWithoutExtension($inputFile)
$outputDir = Join-Path (Join-Path $PSScriptRoot "..") "output"

New-Item -ItemType Directory -Path $outputDir -Force | Out-Null

& d2 $inputFile (Join-Path $outputDir "$name.svg")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& d2 $inputFile (Join-Path $outputDir "$name.png")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& d2 --animate-interval 1000 $inputFile (Join-Path $outputDir "$name.gif")
exit $LASTEXITCODE
