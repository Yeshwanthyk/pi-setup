#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PI_AGENT_DIR=${PI_AGENT_DIR:-"$HOME/.pi/agent"}
BACKUP_DIR="$PI_AGENT_DIR/backups/pi-setup-$(date +%Y%m%d%H%M%S)"

if ! command -v pi >/dev/null 2>&1; then
  echo "error: pi is not installed or not on PATH" >&2
  exit 1
fi

install_resource() {
  source=$1
  relative=$2
  destination="$PI_AGENT_DIR/$relative"

  if [ -f "$destination" ] && cmp -s "$source" "$destination"; then
    printf 'unchanged %s\n' "$relative"
    return
  fi

  if [ -e "$destination" ] || [ -L "$destination" ]; then
    backup="$BACKUP_DIR/$relative"
    mkdir -p "$(dirname -- "$backup")"
    cp -P "$destination" "$backup"
    printf 'backed up %s\n' "$relative"
  fi

  mkdir -p "$(dirname -- "$destination")"
  rm -f "$destination"
  cp "$source" "$destination"
  printf 'installed %s\n' "$relative"
}

remove_legacy_resource() {
  relative=$1
  destination="$PI_AGENT_DIR/$relative"

  if [ ! -e "$destination" ] && [ ! -L "$destination" ]; then
    return
  fi

  backup="$BACKUP_DIR/$relative"
  mkdir -p "$(dirname -- "$backup")"
  cp -P "$destination" "$backup"
  rm -f "$destination"
  printf 'removed legacy %s\n' "$relative"
}

mkdir -p "$PI_AGENT_DIR"

while IFS= read -r package || [ -n "$package" ]; do
  case "$package" in
    ''|'#'*) continue ;;
  esac
  printf 'installing package %s\n' "$package"
  pi install "$package"
done < "$SCRIPT_DIR/packages.txt"

install_resource "$SCRIPT_DIR/AGENTS.md" "AGENTS.md"

for theme in \
  ayu-light.json \
  flexoki-light.json \
  github-dark-default.json \
  kanagawa-lotus.json \
  rose-pine-dawn.json \
  vesper.json \
  yesh-rose-pine-dark.json \
  yesh-rose-pine-light.json
do
  remove_legacy_resource "themes/$theme"
done

for directory in agents; do
  find "$SCRIPT_DIR/$directory" -type f | while IFS= read -r source; do
    relative=${source#"$SCRIPT_DIR/"}
    install_resource "$source" "$relative"
  done
done

printf '\nInstalled packages:\n'
pi list

if [ -d "$BACKUP_DIR" ]; then
  printf '\nBackups: %s\n' "$BACKUP_DIR"
fi
