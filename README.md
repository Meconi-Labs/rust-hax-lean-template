# rust-hax-lean-template

A minimal starter template for formally verifying Rust code in **Lean 4** using **Hax** (backed by **Charon** and **Aeneas**), packaged with a reproducible `flake.nix` and a thin `Dockerfile`.

## Quick Start

### Option 1: Nix (Recommended)
Requires [Nix](https://nixos.org/download.html) with flakes enabled:

```bash
nix develop
just check
```

### Option 2: Docker
Requires [Docker](https://www.docker.com/):

```bash
docker build -t rust-hax-lean .
docker run --rm -it -v "$PWD:/workspace" rust-hax-lean just check
```

### Option 3: Local Toolchain (without Nix/Docker)
Install `rustup`, `elan`, `just`, and `cargo-hax`:

```bash
cargo install --locked cargo-hax
just check
```

## Project Layout

```text
.
├── flake.nix                  # Pinned Hax + elan + just devShell
├── Dockerfile                 # Thin nixos/nix container using flake.nix
├── justfile                   # `test`, `extract`, `verify`, `check`
├── Cargo.toml                 # Rust crate + hax-lib dependency
├── hax.toml                   # Hax extraction config (backend = "lean")
├── src/
│   └── lib.rs                 # Example Rust functions with hax_lib contracts
├── proofs/
│   └── lean/
│       ├── lean-toolchain     # Pinned Lean 4 version
│       ├── lakefile.toml      # Lake project configuration
│       └── Proofs.lean        # Lean 4 proof entrypoint
└── .github/workflows/ci.yml   # GitHub Actions CI via Nix
```

## Commands

| Command | Description |
| :--- | :--- |
| `just test` | Run standard Rust unit tests (`cargo test`) |
| `just extract` | Extract Rust to Lean 4 (`cargo hax into lean`) |
| `just verify` | Build and type-check Lean proofs (`lake build`) |
| `just check` | Run `test`, `extract`, and `verify` |
