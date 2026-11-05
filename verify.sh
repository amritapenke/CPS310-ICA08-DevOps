#!/bin/zsh
# Repeatable project checks for macOS.
set -o pipefail
cd "$(dirname "${0}")" || exit 1

echo "Running project verification..."
if [[ -x .venv/bin/python ]]; then
    .venv/bin/python -m pytest -v
else
    python3 -m pytest -v
fi
tests_ok=$?

echo ""
echo "Checking required files..."
files_ok=0
for required_file in requirements.txt config.json; do
    if [[ -f "$required_file" ]]; then
        echo "$required_file found."
    else
        echo "$required_file is missing."
        files_ok=1
    fi
done

echo ""
echo "Checking Git status..."
git status --short
git_ok=$?

if (( tests_ok != 0 || files_ok != 0 || git_ok != 0 )); then
    echo "Verification FAILED."
    exit 1
fi
echo "Verification PASSED."
