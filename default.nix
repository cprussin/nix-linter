{ nixpkgsCommit ? "eaba7870ffc3400eca4407baa24184b7fe337ec1", nixpkgsURL ?
  "https://github.com/NixOS/nixpkgs/archive/${nixpkgsCommit}.tar.gz"
, pkgsPath ? builtins.fetchTarball nixpkgsURL, pkgs ? import pkgsPath { } }:
with pkgs;

(haskellPackages.override ({ overrides = self: super: { }; })).extend
(haskell.lib.packageSourceOverrides { nix-linter = ./.; }) // {
  inherit pkgs;
}
