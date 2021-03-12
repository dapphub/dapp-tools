with import <nixpkgs> {};
{
  orgdapp =
  let
    emacs = emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
      htmlize
      # projectile
      # solarized-theme
    ]));
  in
    stdenv.mkDerivation {
    name = "orgdapp";
    nativeBuildInputs = [ makeWrapper ];
    buildInputs = [ emacs ];
    src = ./.;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/bin
      install bin/* $out/bin;
    '';
    postFixup = let path = lib.makeBinPath [ emacs ]; in ''
      wrapProgram "$out/bin/orgdapp-doc" --prefix PATH ":" "${path}"
      '';
    };
}
