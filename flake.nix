{
  description = "HelloQnx development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      aarch64Cross = pkgs.pkgsCross.aarch64-multiplatform;
      aarch64LinuxGnuGcc = pkgs.writeShellScriptBin "aarch64-linux-gnu-gcc" ''
        exec ${aarch64Cross.stdenv.cc}/bin/aarch64-unknown-linux-gnu-gcc "$@"
      '';
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          cmake
          ninja
          aarch64LinuxGnuGcc
        ];
      };
    };
}