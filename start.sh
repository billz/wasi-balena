#!/bin/bash
set -e

MESSAGE="${MESSAGE:-Hello from balena block!}"
COW="${COW:-tux}"

echo "🐄 Running wasmer cowsay..."
wasmer run /app/cowsay.wasm -- -f "$COW" "$MESSAGE"
