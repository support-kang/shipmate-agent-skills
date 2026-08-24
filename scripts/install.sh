#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./scripts/install.sh <cursor|claude-code|codex> [options]

Options:
  --scope <user|project>  Install for the current user or one project (default: user)
  --project-path <path>   Project directory for project scope (default: current directory)
  --force                 Replace existing Shipmate skill directories
  -h, --help              Show this help
EOF
}

if [[ $# -lt 1 ]]; then
  usage >&2
  exit 2
fi

platform="$1"
shift
scope="user"
project_path="$PWD"
force="false"

case "$platform" in
  cursor|claude-code|codex) ;;
  -h|--help)
    usage
    exit 0
    ;;
  *)
    printf 'Unsupported platform: %s\n' "$platform" >&2
    usage >&2
    exit 2
    ;;
esac

while [[ $# -gt 0 ]]; do
  case "$1" in
    --scope)
      [[ $# -ge 2 ]] || { printf '%s\n' '--scope requires a value' >&2; exit 2; }
      scope="$2"
      shift 2
      ;;
    --project-path)
      [[ $# -ge 2 ]] || { printf '%s\n' '--project-path requires a value' >&2; exit 2; }
      project_path="$2"
      shift 2
      ;;
    --force)
      force="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown option: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

case "$scope" in
  user|project) ;;
  *)
    printf 'Unsupported scope: %s\n' "$scope" >&2
    exit 2
    ;;
esac

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"
"$script_dir/sync-packages.sh"

if [[ "$scope" == "user" ]]; then
  case "$platform" in
    cursor) destination_root="$HOME/.cursor/skills" ;;
    claude-code) destination_root="$HOME/.claude/skills" ;;
    codex) destination_root="$HOME/.codex/skills" ;;
  esac
else
  if [[ ! -d "$project_path" ]]; then
    printf 'Project path does not exist: %s\n' "$project_path" >&2
    exit 1
  fi
  resolved_project="$(cd "$project_path" && pwd -P)"
  case "$platform" in
    cursor) destination_root="$resolved_project/.cursor/skills" ;;
    claude-code) destination_root="$resolved_project/.claude/skills" ;;
    codex) destination_root="$resolved_project/.agents/skills" ;;
  esac
fi

mkdir -p "$destination_root"
destination_root="$(cd "$destination_root" && pwd -P)"

for skill_name in shipmate-setup shipmate; do
  source_path="$repo_root/packages/$platform/$skill_name"
  destination="$destination_root/$skill_name"

  case "$destination" in
    "$destination_root"/shipmate|"$destination_root"/shipmate-setup) ;;
    *)
      printf 'Refusing unsafe destination: %s\n' "$destination" >&2
      exit 1
      ;;
  esac

  if [[ -e "$destination" && "$force" != "true" ]]; then
    printf 'Destination already exists: %s. Re-run with --force to replace it.\n' "$destination" >&2
    exit 1
  fi
  if [[ -e "$destination" ]]; then
    rm -rf "$destination"
  fi

  cp -R "$source_path" "$destination"
  printf 'Installed %s to %s\n' "$skill_name" "$destination"
done

printf '%s\n' 'Start a fresh agent session, then run shipmate-setup in the target repository.'
