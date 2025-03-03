{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, android-nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
      sdk = (import android-nixpkgs { inherit pkgs; }).sdk (sdkPkgs: with sdkPkgs; [
        emulator
        patcher-v4
        platform-tools
        build-tools-30-0-3
        platforms-android-29
        platforms-android-31
        platforms-android-33
        platforms-android-34
        cmdline-tools-latest
        system-images-android-32-google-apis-x86-64
      ]);
    in {
      devShell = pkgs.mkShell {
        buildInputs = [
          pkgs.jdk17
          pkgs.flutter
          pkgs.dart
        ];

        shellHook = ''
          export PATH="${sdk}/bin:$PATH"
          ${(builtins.readFile "${sdk}/nix-support/setup-hook")}
          create-avd() { avdmanager create avd --force --name phone --package "system-images;android-32;google_apis;x86_64"; }
        '';
      };
    });
}
