#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"

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

printf '%s\n' 'Synchronized shared workflow and setup assets into all platform packages.'
