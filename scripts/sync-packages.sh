#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"

canonical_references="$repo_root/skills/shipmate/references"
mkdir -p "$canonical_references"
cp "$repo_root/shared/workflow.md" "$canonical_references/workflow.md"

canonical_setup_assets="$repo_root/skills/shipmate-setup/assets"
canonical_docs_assets="$canonical_setup_assets/docs-template"
mkdir -p "$canonical_setup_assets"
cp "$repo_root/shared/AGENTS.block.md" "$canonical_setup_assets/AGENTS.block.md"

case "$canonical_docs_assets" in
  "$repo_root"/skills/shipmate-setup/assets/docs-template) ;;
  *)
    printf 'Refusing unsafe generated path: %s\n' "$canonical_docs_assets" >&2
    exit 1
    ;;
esac

rm -rf "$canonical_docs_assets"
cp -R "$repo_root/shared/docs-template" "$canonical_docs_assets"

for platform in cursor claude-code codex; do
  dev_references="$repo_root/packages/$platform/shipmate/references"
  mkdir -p "$dev_references"
  cp "$repo_root/shared/workflow.md" "$dev_references/workflow.md"

  setup_assets="$repo_root/packages/$platform/shipmate-setup/assets"
  docs_assets="$setup_assets/docs-template"
  mkdir -p "$setup_assets"
  cp "$repo_root/shared/AGENTS.block.md" "$setup_assets/AGENTS.block.md"

  case "$docs_assets" in
    "$repo_root"/packages/*/shipmate-setup/assets/docs-template) ;;
    *)
      printf 'Refusing unsafe generated path: %s\n' "$docs_assets" >&2
      exit 1
      ;;
  esac

  rm -rf "$docs_assets"
  cp -R "$repo_root/shared/docs-template" "$docs_assets"
done

logo_source="$repo_root/assets/shipmate-logo.png"
for skill_name in shipmate shipmate-setup; do
  skill_assets="$repo_root/skills/$skill_name/assets"
  mkdir -p "$skill_assets"
  cp "$logo_source" "$skill_assets/shipmate-logo.png"
done
for skill_name in shipmate shipmate-setup; do
  skill_assets="$repo_root/packages/codex/$skill_name/assets"
  mkdir -p "$skill_assets"
  cp "$logo_source" "$skill_assets/shipmate-logo.png"
done

printf '%s\n' 'Synchronized canonical skills, compatibility packages, setup assets, and Codex icons.'
