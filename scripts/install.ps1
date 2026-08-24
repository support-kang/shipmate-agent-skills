[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet('cursor', 'claude-code', 'codex')]
    [string]$Platform,

    [ValidateSet('user', 'project')]
    [string]$Scope = 'user',

    [string]$ProjectPath = (Get-Location).Path,

    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
& (Join-Path $PSScriptRoot 'sync-packages.ps1')

if ($Scope -eq 'user') {
    $destinationRoot = switch ($Platform) {
        'cursor' { Join-Path $env:USERPROFILE '.cursor/skills' }
        'claude-code' { Join-Path $env:USERPROFILE '.claude/skills' }
        'codex' { Join-Path $env:USERPROFILE '.codex/skills' }
    }
} else {
    $resolvedProject = (Resolve-Path -LiteralPath $ProjectPath).Path
    $destinationRoot = switch ($Platform) {
        'cursor' { Join-Path $resolvedProject '.cursor/skills' }
        'claude-code' { Join-Path $resolvedProject '.claude/skills' }
        'codex' { Join-Path $resolvedProject '.agents/skills' }
    }
}

New-Item -ItemType Directory -Force -Path $destinationRoot | Out-Null
$resolvedDestinationRoot = (Resolve-Path -LiteralPath $destinationRoot).Path

foreach ($skillName in @('shipmate-setup', 'shipmate')) {
    $source = Join-Path $repoRoot "skills/$skillName"
    $destination = Join-Path $resolvedDestinationRoot $skillName
    $destinationParent = Split-Path -Parent $destination
    if ($destinationParent -ne $resolvedDestinationRoot -or (Split-Path -Leaf $destination) -ne $skillName) {
        throw "Refusing unsafe destination: $destination"
    }
    if ((Test-Path -LiteralPath $destination) -and -not $Force) {
        throw "Destination already exists: $destination. Re-run with -Force to replace this skill directory."
    }
    if (Test-Path -LiteralPath $destination) {
        Remove-Item -LiteralPath $destination -Recurse -Force
    }
    Copy-Item -LiteralPath $source -Destination $destination -Recurse
    Write-Output "Installed $skillName to $destination"
}

Write-Output 'Start a fresh agent session, then run shipmate-setup in the target repository.'
