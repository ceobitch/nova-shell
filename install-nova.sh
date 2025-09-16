#!/bin/bash
# Install Nova binary system-wide

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BINARY_PATH="${SCRIPT_DIR}/dist/aarch64-apple-darwin/nova-aarch64-apple-darwin"

if [[ ! -f "${BINARY_PATH}" ]]; then
    echo "❌ Nova binary not found at ${BINARY_PATH}"
    echo "Run ./build-nova-binary.sh first"
    exit 1
fi

echo "🚀 Installing Nova..."

# Copy to /usr/local/bin as 'nova'
sudo cp "${BINARY_PATH}" /usr/local/bin/nova
sudo chmod +x /usr/local/bin/nova

echo "✅ Nova installed successfully!"
echo ""
echo "🧪 Testing installation..."
nova --version

echo ""
echo "🎉 Nova is ready! You can now use:"
echo "   nova exec --json --yolo 'scan my Mac for malware'"
echo "   nova exec --json 'help me with coding'"
echo ""
echo "💡 Nova gives your Mac a soul. Talk to your computer naturally!"

