#!/usr/bin/env bash
set -euo pipefail
repo=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
"${NVIM:-nvim}" --headless -u "$repo/init.lua" \
  --cmd "set runtimepath^=$repo" \
  "+luafile $repo/tests/config.lua"

# Share installed plugins/tools, but leave the parser directory empty.
fixture=$(mktemp -d)
trap 'rm -rf -- "$fixture"' EXIT
mkdir -p "$fixture/data/nvim"
ln -s "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy" "$fixture/data/nvim/lazy"
ln -s "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/mason" "$fixture/data/nvim/mason"
XDG_DATA_HOME="$fixture/data" XDG_CACHE_HOME="$fixture/cache" XDG_STATE_HOME="$fixture/state" \
  "${NVIM:-nvim}" --headless -u "$repo/init.lua" \
  --cmd "set runtimepath^=$repo" \
  "+luafile $repo/tests/first-install.lua"
