#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 || -z "${1:-}" ]]; then
  echo "Usage: ./scripts/d2_build.sh <input.d2>" >&2
  exit 2
fi

in="$1"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
name="$(basename "${in%.*}")"
output_dir="$repo_root/output"

mkdir -p "$output_dir"

d2 "$in" "$output_dir/$name.svg"
d2 "$in" "$output_dir/$name.png"
d2 --animate-interval 1000 "$in" "$output_dir/$name.gif"
