param(
  [string]$WorkspaceRoot = (Get-Location).Path,
  [string]$BusinessSchema = 'cyroro'
)

$ErrorActionPreference = 'Stop'
$apps = @('web-admin-app', 'web-driver-app')
$stores = @{
  'useOrderStore' = @('create', 'update', 'getDetail', 'redirectWhatsapp', 'getOrderByCustomerIdForStatement', 'getAllByDate')
  'useDriverTaskStore' = @('getLists', 'getDetail', 'update')
  'useBinStore' = @('getAllBinWIthOrder')
  'useDriverStore' = @('getCarTrackApi')
  'useHelperStore' = @('convertStringToDates')
}
$inputs = @('OrderCreateInput', 'OrderUpdateInput', 'StatementInput', 'OrderDateRangeInput', 'DriverTaskUpdateInput')
$forbidden = @('uploadingDeparturePhoto', 'bin_sizes', 'customer_transactions', 'driver_withdrawals', 'VITE_SUPABASE_SCHEMA=trash')
$failures = [System.Collections.Generic.List[string]]::new()

foreach ($app in $apps) {
  $root = Join-Path $WorkspaceRoot $app
  $storeText = ((Get-ChildItem (Join-Path $root 'src/stores') -Filter '*.ts' -File | Get-Content -Raw) -join "`n")
  $storeText = $storeText -replace '(?m)^\s*//.*$', ''
  $storeText = $storeText -replace '(?s)/\*.*?\*/', ''
  $typeText = (Get-ChildItem (Join-Path $root 'src/types') -Filter '*.ts' -File | Get-Content -Raw) -join "`n"
  $envPath = Join-Path $root '.env'
  $envText = if (Test-Path $envPath) { Get-Content $envPath -Raw } else { '' }

  foreach ($store in $stores.Keys) {
    if ($storeText -notmatch [regex]::Escape($store)) { $failures.Add("$app missing store $store") }
    foreach ($action in $stores[$store]) {
      if ($storeText -notmatch "(?m)^\s*(async\s+)?$([regex]::Escape($action))\s*\(") {
        $failures.Add("$app missing action $store.$action")
      }
    }
  }
  foreach ($input in $inputs) {
    if ($typeText -notmatch [regex]::Escape($input)) { $failures.Add("$app missing Input $input") }
  }
  if ($envText -notmatch "(?m)^VITE_SUPABASE_SCHEMA=$([regex]::Escape($BusinessSchema))\s*$") {
    $failures.Add("$app schema is not $BusinessSchema")
  }
  foreach ($legacy in $forbidden) {
    if ($storeText -match [regex]::Escape($legacy)) { $failures.Add("$app has forbidden legacy reference $legacy") }
  }
}

if ($failures.Count -gt 0) {
  $failures | ForEach-Object { Write-Output "FAIL  $_" }
  exit 1
}

Write-Output "PASS  paired Pinia contract, Input names, Cyroro env, and legacy-reference checks"
