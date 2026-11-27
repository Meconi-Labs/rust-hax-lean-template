{
  description = "Rust + Hax + Lean 4 formal verification template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hax.url = "github:cryspen/hax";
  };

  outputs = { self, nixpkgs, hax }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f {
            pkgs = nixpkgs.legacyPackages.${system};
            haxPkg = hax.packages.${system}.default;
          });
    in
    {
      devShells = forAllSystems ({ pkgs, haxPkg }: {
        default = pkgs.mkShell {
          packages = [
            haxPkg
            pkgs.cargo
            pkgs.rustc
            pkgs.elan
            pkgs.just
            pkgs.git
          ];
        };
      });
    };
}
