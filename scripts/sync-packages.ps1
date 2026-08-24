[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$platforms = @('cursor', 'claude-code', 'codex')

foreach ($platform in $platforms) {
    $devReferences = Join-Path $repoRoot "packages/$platform/babysit-dev/references"
    New-Item -ItemType Directory -Force -Path $devReferences | Out-Null
    Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/workflow.md') -Destination (Join-Path $devReferences 'workflow.md') -Force

    $setupAssets = Join-Path $repoRoot "packages/$platform/babysit-setup/assets"
    $docsAssets = Join-Path $setupAssets 'docs-template'
    New-Item -ItemType Directory -Force -Path $setupAssets | Out-Null
    Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/AGENTS.block.md') -Destination (Join-Path $setupAssets 'AGENTS.block.md') -Force
    if (Test-Path -LiteralPath $docsAssets) {
        Remove-Item -LiteralPath $docsAssets -Recurse -Force
    }
    Copy-Item -LiteralPath (Join-Path $repoRoot 'shared/docs-template') -Destination $docsAssets -Recurse
}

Write-Output 'Synchronized shared workflow and setup assets into all platform packages.'
