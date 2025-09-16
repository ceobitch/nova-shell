#!/bin/bash
# Build Nova binary for distribution
# Based on the official Nova/Codex release process

set -euo pipefail

VERSION="${1:-dev}"
TARGET="${2:-$(rustc -vV | grep host | cut -d' ' -f2)}"

echo "🚀 Building Nova v${VERSION} for ${TARGET}"

# Navigate to codex-rs directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}/codex-rs"

# Build the binary
echo "📦 Compiling Nova..."
cargo build --target "${TARGET}" --release --bin codex

# Create distribution directory
DIST_DIR="../dist/${TARGET}"
mkdir -p "${DIST_DIR}"

# Copy binary with Nova-specific name
if [[ "${TARGET}" == *"windows"* ]]; then
    cp "target/${TARGET}/release/codex.exe" "${DIST_DIR}/nova-${TARGET}.exe"
    BINARY_NAME="nova-${TARGET}.exe"
else
    cp "target/${TARGET}/release/codex" "${DIST_DIR}/nova-${TARGET}"
    BINARY_NAME="nova-${TARGET}"
    
    # Make executable
    chmod +x "${DIST_DIR}/${BINARY_NAME}"
fi

echo "✅ Binary created: ${DIST_DIR}/${BINARY_NAME}"

# Create compressed archives
cd "${DIST_DIR}"

# Create .tar.gz (universal compatibility)
tar -czf "${BINARY_NAME}.tar.gz" "${BINARY_NAME}"
echo "✅ Created: ${BINARY_NAME}.tar.gz"

# Create .zst (better compression) if available
if command -v zstd >/dev/null 2>&1; then
    zstd -T0 -19 "${BINARY_NAME}" -o "${BINARY_NAME}.zst"
    echo "✅ Created: ${BINARY_NAME}.zst"
fi

# Test the binary
echo ""
echo "🧪 Testing binary..."
./"${BINARY_NAME}" --version

echo ""
echo "🎉 Nova binary ready for distribution!"
echo "📁 Location: ${DIST_DIR}/"
echo "📦 Files:"
ls -la "${DIST_DIR}/"

echo ""
echo "💡 Next steps:"
echo "   1. Test: ./${BINARY_NAME} --help"
echo "   2. Install: sudo cp ${BINARY_NAME} /usr/local/bin/nova"
echo "   3. Use: nova exec --json --yolo 'scan my Mac for malware'"

