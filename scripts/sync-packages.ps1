[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$platforms = @('cursor', 'claude-code', 'codex')

$canonicalReferences = Join-Path $repoRoot 'skills/shipmate/references'
New-Item -ItemType Directory -Force -Path $canonicalReferences | Out-Null
Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/workflow.md') -Destination (Join-Path $canonicalReferences 'workflow.md') -Force

$canonicalSetupAssets = Join-Path $repoRoot 'skills/shipmate-setup/assets'
$canonicalDocsAssets = Join-Path $canonicalSetupAssets 'docs-template'
New-Item -ItemType Directory -Force -Path $canonicalSetupAssets | Out-Null
Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/AGENTS.block.md') -Destination (Join-Path $canonicalSetupAssets 'AGENTS.block.md') -Force
if (Test-Path -LiteralPath $canonicalDocsAssets) {
    Remove-Item -LiteralPath $canonicalDocsAssets -Recurse -Force
}
Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/docs-template') -Destination $canonicalDocsAssets -Recurse

foreach ($platform in $platforms) {
    $devReferences = Join-Path $repoRoot "packages/$platform/shipmate/references"
    New-Item -ItemType Directory -Force -Path $devReferences | Out-Null
    Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/workflow.md') -Destination (Join-Path $devReferences 'workflow.md') -Force

    $setupAssets = Join-Path $repoRoot "packages/$platform/shipmate-setup/assets"
    $docsAssets = Join-Path $setupAssets 'docs-template'
    New-Item -ItemType Directory -Force -Path $setupAssets | Out-Null
    Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/AGENTS.block.md') -Destination (Join-Path $setupAssets 'AGENTS.block.md') -Force
    if (Test-Path -LiteralPath $docsAssets) {
        Remove-Item -LiteralPath $docsAssets -Recurse -Force
    }
    Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/docs-template') -Destination $docsAssets -Recurse
}

$logoSource = Join-Path $repoRoot 'assets/shipmate-logo.png'
foreach ($skillName in @('shipmate', 'shipmate-setup')) {
    $skillAssets = Join-Path $repoRoot "skills/$skillName/assets"
    New-Item -ItemType Directory -Force -Path $skillAssets | Out-Null
    Copy-Item -LiteralPath $logoSource -Destination (Join-Path $skillAssets 'shipmate-logo.png') -Force
}
foreach ($skillName in @('shipmate', 'shipmate-setup')) {
    $skillAssets = Join-Path $repoRoot "packages/codex/$skillName/assets"
    New-Item -ItemType Directory -Force -Path $skillAssets | Out-Null
    Copy-Item -LiteralPath $logoSource -Destination (Join-Path $skillAssets 'shipmate-logo.png') -Force
}

Write-Output 'Synchronized canonical skills, compatibility packages, setup assets, and Codex icons.'
