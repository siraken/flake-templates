{
  description = "Dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              # Node.js / TypeScript
              nodejs_24
              pnpm

              # Solidity / Foundry
              foundry

              # Utilities
              jq
            ];

            shellHook = ''
              echo "dapps dev environment loaded"
              echo "  node: $(node --version)"
              echo "  pnpm: $(pnpm --version)"
              echo "  forge: $(forge --version 2>/dev/null | head -1)"
            '';
          };
        }
      );
    };
}
