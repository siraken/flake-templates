# flake-templates

A collection of Nix flake templates. Quickly set up development environments with `nix flake init`.

## Usage

```bash
nix flake init -t github:siraken/flake-templates#<template-name>
```

## Templates

| Name | Description |
| ---- | ----------- |
| `node` | Node.js (v22) + corepack development environment |
| `php` | PHP + composer development environment |
| `ruby` | Ruby + bundler development environment |
| `rust` | Rust (rustc, cargo, rustfmt, clippy) development environment |
| `go` | Go + gopls development environment |
| `python` | Python 3 + uv development environment |

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
