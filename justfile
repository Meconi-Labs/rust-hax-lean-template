set shell := ["bash", "-euo", "pipefail", "-c"]

# Run standard Rust unit tests
test:
    cargo test

# Extract Rust code to Lean 4 using Hax (Charon + Aeneas)
extract:
    cargo hax into lean

# Type-check and verify Lean 4 proofs
verify:
    cd proofs/lean && lake build

# Full verification pipeline
check: test extract verify
