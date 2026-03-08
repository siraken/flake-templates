# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Nix flake テンプレート集。`nix flake init -t` で利用できる開発環境テンプレートを提供する。

## Architecture

- `flake.nix` — ルートflake。`templates` attribute で各テンプレートを登録する
- `<template-name>/flake.nix` — 各テンプレートの実体。`devShells` を定義する

テンプレートを追加する際は:
1. `<template-name>/` ディレクトリに `flake.nix` を作成
2. ルートの `flake.nix` の `templates` に新しいエントリを追加

## Conventions

- nixpkgs は `github:NixOS/nixpkgs/nixpkgs-unstable` を使用
- 対象システム: `x86_64-linux`, `aarch64-linux`, `x86_64-darwin`, `aarch64-darwin`
- `forAllSystems` パターンで全対象システム向けに `devShells` を生成

## Commands

```bash
# テンプレート一覧を確認
nix flake show

# テンプレートを使ってプロジェクトを初期化（例: node）
nix flake init -t github:siraken/flake-templates#node

# flake の評価チェック
nix flake check
```
