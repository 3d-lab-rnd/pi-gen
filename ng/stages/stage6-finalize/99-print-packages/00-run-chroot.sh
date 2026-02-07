#!/bin/bash -e
# Print all installed packages with versions for build log reference

echo ""
echo "========================================"
echo "  INSTALLED PACKAGES (for reference)"
echo "========================================"
echo ""

dpkg-query -W -f='${Package}\t${Version}\n' | sort | column -t -s $'\t'

echo ""
echo "========================================"
echo "  Total packages: $(dpkg-query -W | wc -l)"
echo "========================================"
echo ""
