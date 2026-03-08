{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-index-database,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        # Replace "myhostname" with your actual hostname
        myhostname = import ./hosts/myhostname { inherit inputs; };
      };
    };
}
