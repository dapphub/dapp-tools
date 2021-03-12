{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  name = "orgdapp-shell";
  buildInputs =
  let orgdapp = (import ./orgdapp.nix).orgdapp;
    in
    with pkgs; [
      python3Packages.black
      orgdapp
    ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${toString <nixpkgs>}"
    export LD_LIBRARY_PATH="${libvirt}/lib:$LD_LIBRARY_PATH"
  '';
}
