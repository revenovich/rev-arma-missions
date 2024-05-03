#!/bin/bash
set -euo pipefail
for x in makepbo.linux makepbo makepbo.exe; do
  if command -v $x &> /dev/null; then
    cmd=$x
  fi
done
if [ -z "${cmd:-}" ]; then
  >&2 echo makepbo not found
  exit 1
fi
$cmd -N Zeus_yymmdd_Template.Stratis Zeus_yymmdd_Template-$(git describe).Stratis
