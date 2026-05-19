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
        ada = {
          path = ./ada;
          description = "Ada development environment with GNAT, gprbuild and Alire";
        };
        c = {
          path = ./c;
          description = "C development environment with GCC, GNU Make and clang-tools";
        };
        cpp = {
          path = ./cpp;
          description = "C++ development environment with GCC, CMake and clang-tools";
        };
        haskell = {
          path = ./haskell;
          description = "Haskell development environment with GHC, Cabal and HLS";
        };
        ocaml = {
          path = ./ocaml;
          description = "OCaml development environment with Dune, opam and ocaml-lsp";
        };
        kotlin = {
          path = ./kotlin;
          description = "Kotlin development environment with Gradle";
        };
        lua = {
          path = ./lua;
          description = "Lua development environment with LuaJIT and lua-language-server";
        };
        node = {
          path = ./node;
          description = "Node.js development environment with pnpm";
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
        terraform = {
          path = ./terraform;
          description = "Terraform development environment";
        };
        opentofu = {
          path = ./opentofu;
          description = "OpenTofu development environment";
        };
        dotnet = {
          path = ./dotnet;
          description = ".NET development environment";
        };
        flutter = {
          path = ./flutter;
          description = "Flutter development environment";
        };
        java = {
          path = ./java;
          description = "Java development environment with Gradle and Maven";
        };
        elixir = {
          path = ./elixir;
          description = "Elixir development environment";
        };
        clojure = {
          path = ./clojure;
          description = "Clojure development environment with Leiningen";
        };
        typst = {
          path = ./typst;
          description = "Typst development environment";
        };
        zig = {
          path = ./zig;
          description = "Zig development environment";
        };
        dapps = {
          path = ./dapps;
          description = "Dapps development environment with Foundry and Node.js";
        };
        nixos = {
          path = ./nixos;
          description = "NixOS configuration with home-manager and nix-index-database";
        };
      };
    };
}
