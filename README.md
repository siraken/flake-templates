# flake-templates

A collection of Nix flake templates. Quickly set up development environments with `nix flake init`.

## Usage

```bash
nix flake init -t github:siraken/flake-templates#<template-name>
```

## Templates

| Name | Description |
| ---- | ----------- |
| `ada` | Ada (GNAT) + gprbuild + Alire development environment |
| `c` | C (GCC) + GNU Make + clang-tools development environment |
| `cpp` | C++ (GCC) + CMake + clang-tools development environment |
| `haskell` | Haskell (GHC) + Cabal + haskell-language-server development environment |
| `ocaml` | OCaml + Dune + opam + ocaml-lsp development environment |
| `kotlin` | Kotlin + Gradle development environment |
| `lua` | Lua + LuaJIT + lua-language-server development environment |
| `node` | Node.js (v24) + pnpm development environment |
| `php` | PHP + composer development environment |
| `ruby` | Ruby + bundler development environment |
| `rust` | Rust (rustc, cargo, rustfmt, clippy) development environment |
| `go` | Go + gopls development environment |
| `python` | Python 3 + uv development environment |
| `terraform` | Terraform + tflint + terraform-docs development environment |
| `opentofu` | OpenTofu + tflint + terraform-docs development environment |
| `dotnet` | .NET SDK + OmniSharp development environment |
| `flutter` | Flutter + Dart development environment |
| `java` | JDK + Gradle + Maven development environment |
| `elixir` | Elixir + Erlang/OTP development environment |
| `clojure` | Clojure + Leiningen development environment |
| `typst` | Typst + tinymist development environment |
| `nixos` | NixOS configuration with home-manager and nix-index-database |

## Adding a Template

1. Create `<template-name>/flake.nix`
2. Add an entry to `templates` in the root `flake.nix`

```nix
templates = {
  my-template = {
    path = ./my-template;
    description = "My template description";
  };
};
```
