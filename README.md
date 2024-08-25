<p align="center">
  <a href="https://versia.pub"><img src="https://cdn.versia.pub/branding/versia-dark.webp" alt="Versia Logo" height="110"></a>
</p>

# Versia NixOS module

> This is still WIP.

## Usage

Add the following to your flake inputs:
```nix
versia-module = {
  url = "github:lysand-org/nixos-module";
  inputs.nixpkgs.follows = "nixpkgs";
};
```
