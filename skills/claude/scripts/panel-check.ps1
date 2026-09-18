[CmdletBinding()]
param(
  [string]$AppRoot = (Get-Location).Path,
  [string]$DevUrl,
  [string]$TypecheckCommand = 'pnpm.cmd typecheck',
  [string]$BuildCommand = 'pnpm.cmd build',
  [switch]$SkipTypecheck,
  [switch]$SkipBuild
)

$ErrorActionPreference = 'Stop'

function Invoke-ProjectCommand {
  param(
    [string]$Label,
    [string]$Command
  )

  Write-Host "[$Label] $Command"
  Push-Location -LiteralPath $AppRoot
  try {
    & cmd.exe /d /s /c $Command
    if ($LASTEXITCODE -ne 0) {
      Write-Host "[$Label] BLOCK exit=$LASTEXITCODE"
      return $false
    }
    Write-Host "[$Label] PASS"
    return $true
  } finally {
    Pop-Location
  }
}

if (-not (Test-Path -LiteralPath $AppRoot -PathType Container)) {
  Write-Host "[root] BLOCK $AppRoot"
  exit 2
}

$failed = $false
if (-not $SkipTypecheck -and -not (Invoke-ProjectCommand 'typecheck' $TypecheckCommand)) {
  $failed = $true
}
if (-not $SkipBuild -and -not (Invoke-ProjectCommand 'build' $BuildCommand)) {
  $failed = $true
}

if ($DevUrl) {
  try {
    $response = Invoke-WebRequest -Uri $DevUrl -Method Get -TimeoutSec 10 -UseBasicParsing
    Write-Host "[http] PASS $DevUrl status=$([int]$response.StatusCode)"
  } catch {
    Write-Host "[http] BLOCK $DevUrl"
    $failed = $true
  }
}

if ($failed) {
  exit 1
}
Write-Host '[panel-check] PASS'
exit 0
