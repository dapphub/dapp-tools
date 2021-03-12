{ stdenv }:

let orgdapp = (import ./orgdapp.nix).orgdapp;
in stdenv.mkDerivation {
    name = "planning_site";
    src = ./.;
    buildInputs = [ orgdapp ];
    installPhase = ''
      mkdir -p $out
      install out/* $out/
    '';
}
