#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 --slug <slug> --title <title> --date <timestamp> --description <text> --tags <comma,separated,tags>"
}

slug=""
title=""
date=""
description=""
tags_csv=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --slug)
      slug="$2"
      shift 2
      ;;
    --title)
      title="$2"
      shift 2
      ;;
    --date)
      date="$2"
      shift 2
      ;;
    --description)
      description="$2"
      shift 2
      ;;
    --tags)
      tags_csv="$2"
      shift 2
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$slug" || -z "$title" || -z "$date" || -z "$description" || -z "$tags_csv" ]]; then
  usage
  exit 1
fi

if [[ ! "$slug" =~ ^[a-z0-9-]+$ ]]; then
  echo "Slug must use lowercase letters, digits, and hyphens only."
  exit 1
fi

output="content/posts/${slug}.md"

if [[ -e "$output" ]]; then
  echo "Refusing to overwrite existing file: $output"
  exit 1
fi

{
  echo "---"
  printf 'title: "%s"\n' "$title"
  printf 'date: %s\n' "$date"
  echo "tags:"
  IFS=',' read -r -a tags <<< "$tags_csv"
  for raw_tag in "${tags[@]}"; do
    tag="${raw_tag#"${raw_tag%%[![:space:]]*}"}"
    tag="${tag%"${tag##*[![:space:]]}"}"
    [[ -n "$tag" ]] && printf '  - %s\n' "$tag"
  done
  echo "draft: false"
  printf 'description: "%s"\n' "$description"
  echo "---"
  echo
} > "$output"

echo "Created $output"
