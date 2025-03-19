{
  description = "Starlight documentation project template with pnpm and devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      nodejs = pkgs.nodejs_latest;
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          nodejs
          nodePackages.pnpm
          git
          nodePackages.prettier
          nodePackages.typescript
          pnpm
          python3
          nodePackages.node-gyp
        ];

        shellHook = ''
          export PATH="$PWD/docs/node_modules/.bin:$PATH"
          if [ ! -f docs/package.json ]; then
            echo "Bootstrapping Starlight project in ./docs ..."
            cd docs
            pnpm create starlight@latest . --yes
            cd ..
          fi
        '';
      };
    });
}
# TODO: In your Astro project, you can read from this config to toggle Plausible snippet.
# Example usage in Astro:
# if (import.meta.env.ENABLE_PLAUSIBLE === "true") then render <Plausible domain="..." />

