{
  description = "siraken's flake templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
      ...
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      treefmtEval = forAllSystems (
        system:
        treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
        }
      );
    in
    {
      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);

      templates = {
        default = {
          path = ./default;
          description = "Minimal development environment";
        };
        node = {
          path = ./node;
          description = "Node.js development environment with corepack";
        };
        php = {
          path = ./php;
          description = "PHP development environment with composer";
        };
        ruby = {
          path = ./ruby;
          description = "Ruby development environment with bundler";
        };
        rust = {
          path = ./rust;
          description = "Rust development environment";
        };
        go = {
          path = ./go;
          description = "Go development environment";
        };
        python = {
          path = ./python;
          description = "Python development environment with uv";
        };
      };
    };
}
