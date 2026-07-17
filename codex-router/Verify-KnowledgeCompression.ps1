param(
  [Parameter(Mandatory = $true)][string]$IndexPath,
  [Parameter(Mandatory = $true)][string]$DetailsPath,
  [string]$ExpectedDetailsHash,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
$index = Join-Path $codexRoot $IndexPath
$details = Join-Path $codexRoot $DetailsPath

if (-not (Test-Path -LiteralPath $index -PathType Leaf)) { throw "Missing index: $index" }
if (-not (Test-Path -LiteralPath $details -PathType Leaf)) { throw "Missing details: $details" }

$indexText = Get-Content -LiteralPath $index -Raw
$detailsText = Get-Content -LiteralPath $details -Raw
$detailsHash = (Get-FileHash -LiteralPath $details -Algorithm SHA256).Hash
$indexHeadings = @([regex]::Matches($indexText, '(?m)^#{1,4}\s+.+$')).Count
$detailsHeadings = @([regex]::Matches($detailsText, '(?m)^#{1,4}\s+.+$')).Count
$skillPathViolation = ($index -match '[\\/]skills[\\/]' -or $details -match '[\\/]skills[\\/]')
$hashMatch = [string]::IsNullOrWhiteSpace($ExpectedDetailsHash) -or $detailsHash -eq $ExpectedDetailsHash

$result = [pscustomobject]@{
  index = $IndexPath
  details = $DetailsPath
  index_bytes = (Get-Item -LiteralPath $index).Length
  details_bytes = (Get-Item -LiteralPath $details).Length
  index_estimated_tokens = [math]::Ceiling($indexText.Length / 4)
  details_estimated_tokens = [math]::Ceiling($detailsText.Length / 4)
  index_headings = $indexHeadings
  details_headings = $detailsHeadings
  details_sha256 = $detailsHash
  expected_hash_match = $hashMatch
  skill_path_violation = $skillPathViolation
  preservation_check = ($detailsText.Length -gt $indexText.Length -and $detailsHeadings -gt 0 -and $hashMatch -and -not $skillPathViolation)
}

if ($Json) { $result | ConvertTo-Json -Depth 4 } else { $result | Format-List }
if (-not $result.preservation_check) { exit 1 }
