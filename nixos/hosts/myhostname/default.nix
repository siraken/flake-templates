{
  inputs,
  ...
}:
let
  system = "x86_64-linux";
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.myuser = import ./home.nix;
      };
    }

    inputs.nix-index-database.nixosModules.nix-index
    {
      programs.nix-index-database.comma.enable = true;
    }
  ];
}
