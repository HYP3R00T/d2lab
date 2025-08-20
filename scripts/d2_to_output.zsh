#!/usr/bin/env zsh

# Usage: zsh scripts/d2_to_output.zsh <input.d2>
in="$1"
if [[ -z "$in" ]]; then
  echo "Usage: $0 <input.d2>" >&2
  exit 2
fi

name=${in:t:r}
d2 "$in" "./output/$name.png"
d2 "$in" "./output/$name.svg"
