with (import <nixpkgs> {});
let
  gems = bundlerEnv {
    name = "dapp-tools";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "dapp-tools";
  buildInputs = [gems ruby];
}
