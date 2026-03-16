# Homebrew Personal

Personal Homebrew tap for custom casks and formulas. Local patches, unmaintained upstreams, and private apps.

## Quick Start

```bash
# Tap the repo
brew tap codevski/brew

# Install fladder (or any cask/formula)
brew install codevski/brew/fladder

# Upgrade everything
brew upgrade


```
## Structure
.
├── Casks/          # macOS GUI apps (.rb)
├── Formula/        # CLI tools (.rb)  
├── aliases/        # Alternate package names
