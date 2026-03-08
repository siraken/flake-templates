# flake-templates

Nix flake テンプレート集。`nix flake init` で開発環境をすぐにセットアップできます。

## Usage

```bash
nix flake init -t github:siraken/flake-templates#<template-name>
```

## Templates

| Name | Description |
| ---- | ----------- |
| `node` | Node.js (v22) + corepack の開発環境 |

## Adding a Template

1. `<template-name>/flake.nix` を作成
2. ルートの `flake.nix` の `templates` にエントリを追加

```nix
templates = {
  my-template = {
    path = ./my-template;
    description = "My template description";
  };
};
```
