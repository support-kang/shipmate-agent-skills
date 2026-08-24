#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"
errors=0

require_file() {
  if [[ ! -f "$repo_root/$1" ]]; then
    printf 'Missing required file: %s\n' "$repo_root/$1" >&2
    errors=$((errors + 1))
  fi
}

for required_file in \
  LICENSE \
  THIRD_PARTY_NOTICES.md \
  third_party/ponytail/LICENSE \
  third_party/karpathy-guidelines/NOTICE.md \
  assets/shipmate-logo.png \
  skills/shipmate/references/workflow.md \
  skills/shipmate/agents/openai.yaml \
  skills/shipmate/assets/shipmate-logo.png \
  skills/shipmate-setup/assets/AGENTS.block.md \
  skills/shipmate-setup/assets/docs-template/README.md \
  skills/shipmate-setup/assets/docs-template/features/README.md \
  skills/shipmate-setup/assets/docs-template/plans/README.md \
  skills/shipmate-setup/assets/docs-template/decisions/README.md \
  skills/shipmate-setup/assets/docs-template/runbooks/README.md \
  skills/shipmate-setup/assets/docs-template/reference/README.md \
  skills/shipmate-setup/assets/docs-template/reference/testing.md \
  skills/shipmate-setup/agents/openai.yaml \
  skills/shipmate-setup/assets/shipmate-logo.png; do
  require_file "$required_file"
done

for skill_name in shipmate-setup shipmate; do
  skill_file="$repo_root/skills/$skill_name/SKILL.md"
  require_file "skills/$skill_name/SKILL.md"
  if [[ -f "$skill_file" ]]; then
    grep -q "^name: $skill_name$" "$skill_file" || {
      printf 'Invalid canonical skill name in %s\n' "$skill_file" >&2
      errors=$((errors + 1))
    }
    grep -q '^description: .' "$skill_file" || {
      printf 'Missing canonical skill description in %s\n' "$skill_file" >&2
      errors=$((errors + 1))
    }
    if grep -Eq 'TODO|PLACEHOLDER' "$skill_file"; then
      printf 'Unfinished placeholder in %s\n' "$skill_file" >&2
      errors=$((errors + 1))
    fi
  fi
done

agents_block="$repo_root/skills/shipmate-setup/assets/AGENTS.block.md"
if [[ -f "$agents_block" ]]; then
  start_count="$(grep -c '<!-- shipmate:start -->' "$agents_block" || true)"
  end_count="$(grep -c '<!-- shipmate:end -->' "$agents_block" || true)"
  if [[ "$start_count" -ne 1 || "$end_count" -ne 1 ]]; then
    printf '%s\n' 'The AGENTS managed block must contain exactly one start and one end marker.' >&2
    errors=$((errors + 1))
  fi
fi

if [[ "$errors" -ne 0 ]]; then
  printf 'Validation failed with %s error(s).\n' "$errors" >&2
  exit 1
fi

printf '%s\n' 'Validated the 2 canonical Shipmate skills and their required resources.'
