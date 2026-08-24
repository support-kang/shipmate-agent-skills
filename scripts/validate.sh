#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"
"$script_dir/sync-packages.sh"

errors=0

require_file() {
  if [[ ! -f "$1" ]]; then
    printf 'Missing required file: %s\n' "$1" >&2
    errors=$((errors + 1))
  fi
}

for legal_file in \
  LICENSE \
  THIRD_PARTY_NOTICES.md \
  third_party/ponytail/LICENSE \
  third_party/karpathy-guidelines/NOTICE.md; do
  require_file "$repo_root/$legal_file"
done

for platform in cursor claude-code codex; do
  for skill_name in shipmate-setup shipmate; do
    skill_root="$repo_root/packages/$platform/$skill_name"
    skill_file="$skill_root/SKILL.md"
    require_file "$skill_file"
    if [[ -f "$skill_file" ]]; then
      grep -q "^name: $skill_name$" "$skill_file" || {
        printf 'Invalid skill name in %s\n' "$skill_file" >&2
        errors=$((errors + 1))
      }
      grep -q '^description: .' "$skill_file" || {
        printf 'Missing skill description in %s\n' "$skill_file" >&2
        errors=$((errors + 1))
      }
      if grep -Eq 'TODO|PLACEHOLDER' "$skill_file"; then
        printf 'Unfinished placeholder in %s\n' "$skill_file" >&2
        errors=$((errors + 1))
      fi
    fi
  done

  require_file "$repo_root/packages/$platform/shipmate/references/workflow.md"
  require_file "$repo_root/packages/$platform/shipmate-setup/assets/AGENTS.block.md"
  require_file "$repo_root/packages/$platform/shipmate-setup/assets/docs-template/README.md"
done

agents_block="$repo_root/shared/AGENTS.block.md"
start_count="$(grep -c '<!-- shipmate:start -->' "$agents_block" || true)"
end_count="$(grep -c '<!-- shipmate:end -->' "$agents_block" || true)"
if [[ "$start_count" -ne 1 || "$end_count" -ne 1 ]]; then
  printf '%s\n' 'The AGENTS managed block must contain exactly one start and one end marker.' >&2
  errors=$((errors + 1))
fi

if [[ "$errors" -ne 0 ]]; then
  printf 'Validation failed with %s error(s).\n' "$errors" >&2
  exit 1
fi

printf '%s\n' 'Validated 6 skill packages and their shared resources.'
