FROM nixos/nix:latest

RUN printf "experimental-features = nix-command flakes\naccept-flake-config = true\n" >> /etc/nix/nix.conf

WORKDIR /workspace

# Cache the Nix devShell before copying the rest of the repo
COPY flake.nix flake.lock* ./
RUN nix develop -L --command true

COPY . .

ENTRYPOINT ["nix", "develop", "--command"]
CMD ["bash"]
