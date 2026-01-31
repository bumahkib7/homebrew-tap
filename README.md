# Homebrew Tap for RMA

This tap contains the Homebrew formula for [RMA (Rust Monorepo Analyzer)](https://github.com/bumahkib7/rust-monorepo-analyzer).

## Installation

```bash
brew tap bumahkib7/tap
brew install rma
```

## Usage

```bash
# Scan current directory
rma scan .

# Output SARIF for CI/CD
rma scan . --format sarif --output results.sarif

# Enable AI analysis
rma scan . --ai
```

## More Information

See the [main repository](https://github.com/bumahkib7/rust-monorepo-analyzer) for full documentation.
