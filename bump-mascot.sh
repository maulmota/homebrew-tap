#!/bin/bash
# Update Casks/mascot.rb to a new released version.
# usage: ./bump-mascot.sh 2.3.0

set -euo pipefail

VERSION="${1:?usage: ./bump-mascot.sh <version, e.g. 2.3.0>}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CASK="$DIR/Casks/mascot.rb"
URL="https://github.com/maulmota/mascot-screensaver/releases/download/v${VERSION}/Mascot.app.zip"

echo "Fetching $URL"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
curl -fsSL -o "$TMP/Mascot.app.zip" "$URL"
SHA="$(shasum -a 256 "$TMP/Mascot.app.zip" | awk '{print $1}')"

sed -i '' \
  -e "s/^  version \".*\"/  version \"${VERSION}\"/" \
  -e "s/^  sha256 \".*\"/  sha256 \"${SHA}\"/" \
  "$CASK"

echo "Updated $CASK"
echo "  version: $VERSION"
echo "  sha256:  $SHA"
echo ""
echo "Review, then: git commit -am 'mascot ${VERSION}' && git push"
