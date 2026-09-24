{
  description = "Nix packages published by wimpysworld";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages =
              with pkgs;
              [
                actionlint
                gh
                just
              ]
              ++ import ./nix/loader.nix { inherit pkgs; };
          };
        }
      );

      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        { }
        // (
          if builtins.pathExists ./pkgs/tailor/default.nix then
            {
              tailor = pkgs.callPackage ./pkgs/tailor/default.nix { };
            }
          else
            { }
        )
        // (
          if builtins.pathExists ./pkgs/wonkey/default.nix then
            {
              wonkey = pkgs.callPackage ./pkgs/wonkey/default.nix { };
            }
          else
            { }
        )
      );
    };
}
