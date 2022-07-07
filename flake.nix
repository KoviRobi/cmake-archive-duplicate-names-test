{
  description = "Test CMake + Clang symbols with same name in different repositories";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs, ... }: {
    defaultPackage.x86_64-linux = with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "archive-duplicate-names-test";
        src = ./.;
        buildInputs = [
          cmake
          ninja
        ];
      };


    devShell.x86_64-linux = self.defaultPackage.x86_64-linux.overrideAttrs (_: { src = null; });
  };
}
