[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
& (Join-Path $PSScriptRoot 'sync-packages.ps1')

$errors = [System.Collections.Generic.List[string]]::new()
$platforms = @('cursor', 'claude-code', 'codex')
$skills = @('shipmate-setup', 'shipmate')

foreach ($legalFile in @(
    'LICENSE',
    'THIRD_PARTY_NOTICES.md',
    'third_party/ponytail/LICENSE',
    'third_party/karpathy-guidelines/NOTICE.md'
)) {
    $legalPath = Join-Path $repoRoot $legalFile
    if (-not (Test-Path -LiteralPath $legalPath)) {
        $errors.Add("Missing licensing file $legalPath")
    }
}

foreach ($logoFile in @(
    'assets/shipmate-logo.png',
    'skills/shipmate/assets/shipmate-logo.png',
    'skills/shipmate-setup/assets/shipmate-logo.png',
    'packages/codex/shipmate/assets/shipmate-logo.png',
    'packages/codex/shipmate-setup/assets/shipmate-logo.png'
)) {
    $logoPath = Join-Path $repoRoot $logoFile
    if (-not (Test-Path -LiteralPath $logoPath)) {
        $errors.Add("Missing logo file $logoPath")
    }
}

$translationLocales = @(
    'ar', 'de', 'es', 'fr', 'hi', 'id', 'it', 'ja', 'pl',
    'pt-BR', 'ru', 'th', 'tr', 'uk', 'vi', 'zh-CN', 'zh-TW'
)
foreach ($locale in $translationLocales) {
    $translationPath = Join-Path $repoRoot "docs/i18n/README.$locale.md"
    if (-not (Test-Path -LiteralPath $translationPath)) {
        $errors.Add("Missing translation file $translationPath")
    }
}

foreach ($skillName in $skills) {
    $skillRoot = Join-Path $repoRoot "skills/$skillName"
    $skillFile = Join-Path $skillRoot 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillFile)) {
        $errors.Add("Missing canonical skill $skillFile")
        continue
    }
    $content = Get-Content -Raw -LiteralPath $skillFile
    if ($content -notmatch "(?ms)^---\s*.*?name:\s*$([regex]::Escape($skillName))\s*.*?description:\s*.+?---") {
        $errors.Add("Invalid frontmatter in canonical skill $skillFile")
    }
    if ($content -match 'TODO|PLACEHOLDER') {
        $errors.Add("Unfinished placeholder in canonical skill $skillFile")
    }
}

foreach ($required in @(
    'skills/shipmate/references/workflow.md',
    'skills/shipmate/agents/openai.yaml',
    'skills/shipmate-setup/assets/AGENTS.block.md',
    'skills/shipmate-setup/assets/docs-template/README.md',
    'skills/shipmate-setup/assets/docs-template/reference/testing.md',
    'skills/shipmate-setup/agents/openai.yaml'
)) {
    $requiredPath = Join-Path $repoRoot $required
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        $errors.Add("Missing canonical resource $requiredPath")
    }
}

foreach ($platform in $platforms) {
    foreach ($skillName in $skills) {
        $skillRoot = Join-Path $repoRoot "packages/$platform/$skillName"
        $skillFile = Join-Path $skillRoot 'SKILL.md'
        if (-not (Test-Path -LiteralPath $skillFile)) {
            $errors.Add("Missing $skillFile")
            continue
        }
        $content = Get-Content -Raw -LiteralPath $skillFile
        if ($content -notmatch "(?ms)^---\s*.*?name:\s*$([regex]::Escape($skillName))\s*.*?description:\s*.+?---") {
            $errors.Add("Invalid frontmatter in $skillFile")
        }
        if ($content -match 'TODO|PLACEHOLDER') {
            $errors.Add("Unfinished placeholder in $skillFile")
        }
    }

    $workflow = Join-Path $repoRoot "packages/$platform/shipmate/references/workflow.md"
    $agentBlock = Join-Path $repoRoot "packages/$platform/shipmate-setup/assets/AGENTS.block.md"
    $docsIndex = Join-Path $repoRoot "packages/$platform/shipmate-setup/assets/docs-template/README.md"
    $testingReference = Join-Path $repoRoot "packages/$platform/shipmate-setup/assets/docs-template/reference/testing.md"
    foreach ($required in @($workflow, $agentBlock, $docsIndex, $testingReference)) {
        if (-not (Test-Path -LiteralPath $required)) {
            $errors.Add("Missing packaged resource $required")
        }
    }
}

$block = Get-Content -Raw -LiteralPath (Join-Path $repoRoot 'shared/AGENTS.block.md')
if (($block | Select-String -Pattern '<!-- shipmate:start -->' -AllMatches).Matches.Count -ne 1 -or
    ($block | Select-String -Pattern '<!-- shipmate:end -->' -AllMatches).Matches.Count -ne 1) {
    $errors.Add('The AGENTS managed block must contain exactly one start and one end marker.')
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output 'Validated 2 canonical skills, 6 compatibility packages, 17 translations, shared resources, and Shipmate branding.'
