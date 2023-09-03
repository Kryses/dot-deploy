#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <unix_path>"
  exit 1
fi

unix_path="$1"
windows_path=$(wslpath -w "$unix_path")

if command -v clip.exe >/dev/null 2>&1; then
  echo -n "$windows_path" | clip.exe
  echo "Windows path copied to cliplboard:"
  echo "$windows_path"
else
  echo "clip.exe (Windows clipboard utility) not found. Ensure you're running this in WSL."
fi


