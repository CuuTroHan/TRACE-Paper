[CmdletBinding()]
param(
    [string]$MainFile = 'trace-paper.tex'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$repositoryRoot = Split-Path -Parent $scriptDirectory
$mainPath = Join-Path $repositoryRoot $MainFile
$source = Get-Content -LiteralPath $mainPath -Raw -Encoding UTF8
$match = [regex]::Match($source, '\\abstract\{(?<abstract>.*?)\}\s*\\keywords', 'Singleline')

if (-not $match.Success) {
    throw "Could not locate the abstract in $mainPath"
}

$plainText = $match.Groups['abstract'].Value
$plainText = $plainText -replace '\\%', '%'
$plainText = $plainText -replace '\\[A-Za-z]+\*?(\[[^\]]*\])?(\{[^{}]*\})?', ' '
$plainText = $plainText -replace '\$[^$]*\$', ' '
$plainText = $plainText -replace '[{}]', ' '

$hyphenGrouped = [regex]::Matches(
    $plainText,
    "\b[\p{L}\p{N}][\p{L}\p{N}'’.-]*\b"
).Count
$hyphenSplit = [regex]::Matches($plainText, '[\p{L}\p{N}]+').Count

[pscustomobject]@{
    File = $mainPath
    HyphenatedCompoundsGrouped = $hyphenGrouped
    HyphenatedCompoundsSplit = $hyphenSplit
    SpringerRange = '150-250'
    BothCountsWithinRange = (
        $hyphenGrouped -ge 150 -and $hyphenGrouped -le 250 -and
        $hyphenSplit -ge 150 -and $hyphenSplit -le 250
    )
}
