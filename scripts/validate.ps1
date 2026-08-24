[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()
$skills = @('shipmate-setup', 'shipmate')

function Require-File([string]$RelativePath) {
    $path = Join-Path $repoRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $errors.Add("Missing required file: $path")
    }
}

foreach ($file in @(
    'LICENSE',
    'THIRD_PARTY_NOTICES.md',
    'third_party/ponytail/LICENSE',
    'third_party/karpathy-guidelines/NOTICE.md',
    'assets/shipmate-logo.png',
    'skills/shipmate/references/workflow.md',
    'skills/shipmate/agents/openai.yaml',
    'skills/shipmate/assets/shipmate-logo.png',
    'skills/shipmate-setup/assets/AGENTS.block.md',
    'skills/shipmate-setup/assets/docs-template/README.md',
    'skills/shipmate-setup/assets/docs-template/features/README.md',
    'skills/shipmate-setup/assets/docs-template/plans/README.md',
    'skills/shipmate-setup/assets/docs-template/decisions/README.md',
    'skills/shipmate-setup/assets/docs-template/runbooks/README.md',
    'skills/shipmate-setup/assets/docs-template/reference/README.md',
    'skills/shipmate-setup/assets/docs-template/reference/testing.md',
    'skills/shipmate-setup/agents/openai.yaml',
    'skills/shipmate-setup/assets/shipmate-logo.png'
)) {
    Require-File $file
}

foreach ($skillName in $skills) {
    $skillFile = Join-Path $repoRoot "skills/$skillName/SKILL.md"
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        $errors.Add("Missing canonical skill: $skillFile")
        continue
    }

    $content = Get-Content -Raw -LiteralPath $skillFile
    if ($content -notmatch "(?ms)^---\s*.*?name:\s*$([regex]::Escape($skillName))\s*.*?description:\s*.+?---") {
        $errors.Add("Invalid frontmatter in canonical skill: $skillFile")
    }
    if ($content -match 'TODO|PLACEHOLDER') {
        $errors.Add("Unfinished placeholder in canonical skill: $skillFile")
    }
}

$blockPath = Join-Path $repoRoot 'skills/shipmate-setup/assets/AGENTS.block.md'
if (Test-Path -LiteralPath $blockPath -PathType Leaf) {
    $block = Get-Content -Raw -LiteralPath $blockPath
    $startCount = ($block | Select-String -Pattern '<!-- shipmate:start -->' -AllMatches).Matches.Count
    $endCount = ($block | Select-String -Pattern '<!-- shipmate:end -->' -AllMatches).Matches.Count
    if ($startCount -ne 1 -or $endCount -ne 1) {
        $errors.Add('The AGENTS managed block must contain exactly one start and one end marker.')
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output 'Validated the 2 canonical Shipmate skills and their required resources.'
