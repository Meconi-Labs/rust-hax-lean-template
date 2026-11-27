FROM nixos/nix:latest

RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

WORKDIR /workspace

# Cache the Nix devShell before copying the rest of the repo
COPY flake.nix flake.lock* ./
RUN nix develop --command true

COPY . .

ENTRYPOINT ["nix", "develop", "--command"]
CMD ["bash"]
