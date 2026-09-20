[CmdletBinding()]
param(
    [string]$MainFile = 'trace-paper.tex'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$repositoryRoot = Split-Path -Parent $scriptDirectory
$mainPath = Join-Path $repositoryRoot $MainFile

if (-not (Test-Path -LiteralPath $mainPath -PathType Leaf)) {
    throw "Main LaTeX file not found: $mainPath"
}

foreach ($toolName in @('pdflatex', 'bibtex')) {
    if (-not (Get-Command $toolName -ErrorAction SilentlyContinue)) {
        throw "Required tool is not on PATH: $toolName"
    }
}

$jobName = [IO.Path]::GetFileNameWithoutExtension($MainFile)
$logPath = Join-Path $repositoryRoot "$jobName.log"
$pdfPath = Join-Path $repositoryRoot "$jobName.pdf"

Push-Location $repositoryRoot
try {
    Write-Host "pdflatex: $((& pdflatex --version | Select-Object -First 1))"
    Write-Host "bibtex:   $((& bibtex --version | Select-Object -First 1))"

    $steps = @(
        @{ Command = 'pdflatex'; Arguments = @('-interaction=nonstopmode', '-halt-on-error', $MainFile) },
        @{ Command = 'bibtex'; Arguments = @($jobName) },
        @{ Command = 'pdflatex'; Arguments = @('-interaction=nonstopmode', '-halt-on-error', $MainFile) },
        @{ Command = 'pdflatex'; Arguments = @('-interaction=nonstopmode', '-halt-on-error', $MainFile) }
    )

    foreach ($step in $steps) {
        Write-Host "Running $($step.Command) $($step.Arguments -join ' ')"
        & $step.Command @($step.Arguments)
        if ($LASTEXITCODE -ne 0) {
            throw "$($step.Command) failed with exit code $LASTEXITCODE"
        }
    }

    if (-not (Test-Path -LiteralPath $pdfPath -PathType Leaf)) {
        throw "Expected PDF was not created: $pdfPath"
    }

    $blockingPatterns = @(
        '^!',
        'undefined references',
        'undefined citations',
        'Overfull \\[hv]box',
        'destination with the same identifier'
    )
    $blockingLogLines = Select-String -LiteralPath $logPath -Pattern $blockingPatterns
    if ($blockingLogLines) {
        $details = $blockingLogLines | ForEach-Object { "$($_.LineNumber): $($_.Line)" }
        throw "Blocking LaTeX diagnostics were found:`n$($details -join "`n")"
    }

    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $pdfPath
    Write-Host "Build succeeded: $pdfPath"
    Write-Host "SHA-256: $($hash.Hash)"
}
finally {
    Pop-Location
}
