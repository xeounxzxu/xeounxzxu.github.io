#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 --file <path> [--file <path> ...] --message <commit-message>"
}

files=()
message=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --file)
      files+=("$2")
      shift 2
      ;;
    --message)
      message="$2"
      shift 2
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done

if [[ ${#files[@]} -eq 0 || -z "$message" ]]; then
  usage
  exit 1
fi

for file in "${files[@]}"; do
  if [[ ! -e "$file" ]]; then
    echo "Missing file: $file"
    exit 1
  fi
done

hugo
git add "${files[@]}"
git commit -m "$message"
git push origin main
