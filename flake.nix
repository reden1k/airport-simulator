{
  description = "airport-simulator dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Go
            go
            gopls
            golangci-lint
            delve

            # Proto
            protobuf
            protoc-gen-go
            protoc-gen-go-grpc

            # Infra
            kubectl
            helm
            k9s

            # DB/tools
            postgresql
            redis

            # k6
            k6

            # Misc
            gnumake
            docker-compose
          ];

          shellHook = ''
            export GOPATH=$HOME/go
            export PATH=$PATH:$GOPATH/bin
          '';
        };
      }
    );
}
