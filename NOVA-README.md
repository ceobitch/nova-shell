# Nova - Your Mac's Soul

**Nova gives your Mac a soul.** You talk. It acts. Security checks, cleanup, control, and coding in one natural conversation.

Nova is the first AI assistant that truly lives inside your computer, speaking to you naturally without requiring developer expertise.

## ✨ What Nova Does

**🛡️ Security Guardian**
- Scans for wallet drainers and malware
- Checks persistence mechanisms (LaunchAgents, Login Items, cron jobs)
- Audits app permissions (TCC database)
- Verifies code signing and notarization
- Monitors clipboard for address swaps
- Watches network connections for suspicious activity
- Quarantines threats to ~/Desktop/Quarantine/

**💻 System Management**
- File management and cleanup
- Performance optimization
- System maintenance
- Process monitoring

**👨‍💻 Development Assistant**
- Code debugging and development
- Project management
- Technical explanations in plain English
- Automated testing and building

## 🚀 Quick Start

### Installation

```bash
# Download and extract
wget https://your-domain.com/nova-aarch64-apple-darwin.tar.gz
tar -xzf nova-aarch64-apple-darwin.tar.gz

# Install system-wide
sudo cp nova-aarch64-apple-darwin /usr/local/bin/nova
sudo chmod +x /usr/local/bin/nova

# Or use our installer
./install-nova.sh
```

### Authentication

```bash
# Login with your OpenAI API key
nova login --api-key "your-api-key-here"

# Or set as environment variable
export OPENAI_API_KEY="your-api-key-here"
```

### Basic Usage

```bash
# Interactive mode (full TUI)
nova

# Command mode with JSON output
nova exec --json "scan my Mac for malware"

# Full system access (for security scans)
nova exec --json --yolo "comprehensive security check"
```

## 🛡️ Security Features

### Comprehensive Malware Protection

```bash
# Full security scan
nova exec --json --yolo "run a complete security scan for wallet drainers"

# Specific checks
nova exec --json --yolo "check for persistence mechanisms"
nova exec --json --yolo "audit app permissions"
nova exec --json --yolo "verify code signatures"
```

### What Nova Checks

**Persistence Sweep**
- ~/Library/LaunchAgents
- /Library/LaunchAgents  
- /Library/LaunchDaemons
- Login Items
- Cron jobs
- Shell profiles (.bashrc, .zshrc, etc.)

**TCC Permissions Audit**
- Accessibility permissions
- AppleEvents permissions  
- Screen Recording permissions
- Highlights unknown binaries outside /Applications

**Executable Integrity**
- Code signing verification
- Notarization status
- Recent executables in user areas
- Suspicious browser extensions

**Behavior Monitoring**
- Clipboard address swapping detection
- Unusual network connections
- Non-system process monitoring

## 💬 Natural Conversation

Nova speaks naturally, without technical jargon:

```bash
# Instead of complex commands, just talk:
nova exec --json "my computer feels slow, can you help?"
nova exec --json "I think something suspicious is running"
nova exec --json "help me clean up my downloads folder"
nova exec --json "check if my passwords are safe"
```

## 🔧 JSON API Integration

Perfect for integrating into Mac apps:

```json
// Task started
{"id":"0","msg":{"type":"task_started"}}

// Nova's response
{"id":"0","msg":{"type":"agent_message","message":"I'm scanning your Mac for threats..."}}

// Security scan results
{"id":"0","msg":{"type":"exec_command_end","stdout":"Found 3 suspicious files..."}}

// Task complete
{"id":"0","msg":{"type":"task_complete"}}
```

## 🏗️ Building from Source

```bash
# Clone and build
git clone https://github.com/your-org/nova-shell.git
cd nova-shell
./build-nova-binary.sh

# Cross-compile for different platforms
./build-nova-binary.sh v1.0.0 x86_64-unknown-linux-musl
./build-nova-binary.sh v1.0.0 aarch64-apple-darwin
```

## 🎯 Use Cases

**For Regular Users**
- "scan my Mac for viruses"
- "clean up my computer"
- "check if my passwords are safe"
- "help me organize my files"

**For Developers**
- "debug this Python script"
- "help me build this React app"
- "explain this error message"
- "optimize my code"

**For System Admins**
- "audit system permissions"
- "check for security vulnerabilities"
- "monitor system performance"
- "automate maintenance tasks"

## 🔒 Security Model

Nova operates with configurable security levels:

- **read-only**: Can only read files
- **workspace-write**: Can write within project folders
- **danger-full-access**: Full system access (for security scans)

Use `--yolo` flag for full access when running security operations.

## 🌟 What Makes Nova Special

Nova is the first AI to give your computer a true soul:

- **Lives inside your Mac**: Not a cloud service, runs locally
- **Speaks naturally**: No technical jargon required
- **Protects actively**: Constantly watching for threats
- **Acts intelligently**: Understands context and intent
- **Learns your workflow**: Adapts to how you work

---

**Nova gives your Mac a soul. You talk. It acts.**

*Security checks, cleanup, control, and coding in one natural conversation.*

