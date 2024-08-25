{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    activitypub = {
      url = "github:lysand-org/activitypub";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    versiajs = {
      url = "github:lysand-org/server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://cache.kyouma.net"
    ];
    extra-trusted-public-keys = [
      "cache.kyouma.net:Frjwu4q1rnwE/MnSTmX9yx86GNA/z3p/oElGvucLiZg="
    ];
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs: {
    nixosModules.default = {
      imports = [ ./module.nix ];
      nixpkgs.overlays = [ 
        inputs.activitypub.overlays.default
        inputs.versiajs.overlays.default
      ];
    };
  };
}
