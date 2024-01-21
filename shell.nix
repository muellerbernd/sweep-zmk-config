{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  # Build the Zephyr SDK as a nix package.
  new-zephyr-sdk-pkg =
    { stdenv
    , fetchurl
    , which
    , python38
    , wget
    , file
    , cmake
    , libusb
    , autoPatchelfHook
    }:
    # let
    #   version = "0.16.4";
    #   arch = "arm";
    #   sdk = fetchurl {
    #     url = "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${version}/zephyr-sdk-${version}_linux-x86_64_minimal.tar.gz";
    #     hash = "sha256-dn+7HVBtvDs2EyXSLMb12Q+Q26+x6HYyPP69QdLKka8=";
    #   };
    #   armToolchain = fetchurl {
    #     url = "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${version}/toolchain_linux-x86_64_arm-zephyr-eabi.tar.gz";
    #     hash = "sha256-B7YIZEyuqE+XNI7IWnN6WiC1k9UdFEt4YN4Yr7Vn3Po=";
    #   };
    #   x86_64Toolchain = fetchurl {
    #     url = "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${version}/toolchain_linux-x86_64_x86_64-zephyr-elf.tar.gz";
    #     hash = "sha256-9PoILowiS8wgfB/vdrpJUostIMyS62jjd21nRzWBQ/k=";
    #   };
    # in
    stdenv.mkDerivation rec {
      pname = "zephyr-sdk";
      version = "0.16.4";
      src = builtins.fetchTarball {
        url = "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${version}/zephyr-sdk-${version}_linux-x86_64.tar.xz";
        sha256 = "sha256:0ar67c4j2sgg0iv0w92097ik8bi98j8wc7lqcf7imgqqlw9wicbn";
      };
      # srcs = [ sdk armToolchain x86_64Toolchain ];
      # srcRoot = ".";
      nativeBuildInputs = [
        # which
        # wget
        # file
        # python38
        # autoPatchelfHook
        # cmake
        # libusb
      ];
      # phases = [ "installPhase" "fixupPhase" ];
      # installPhase = ''
      #   runHook preInstall
      #   echo out=$out
      #   mkdir -p $out
      #   set $srcs
      #   tar -xf $1 -C $out --strip-components=1
      #   tar -xf $2 -C $out
      #   tar -xf $3 -C $out
      #   (cd $out; bash ./setup.sh -h)
      #   rm $out/zephyr-sdk-x86_64-hosttools-standalone-0.9.sh
      #   runHook postInstall
      # '';
    };
  zephyr-sdk = pkgs.callPackage new-zephyr-sdk-pkg { };
  # Build the Zephyr as a nix package.
  new-zephyr-pkg =
    { stdenv
    , file
    , cmake
    , libusb
    , autoPatchelfHook
    }:
    stdenv.mkDerivation rec {
      pname = "zephyr";
      version = "3.5.0";
      src = builtins.fetchTarball {
        url = "https://github.com/zephyrproject-rtos/zephyr/archive/refs/tags/v${version}.tar.gz";
        sha256 = "sha256:1vw55ck81abhg50gijksicvmq82x2y8825zyi20mx44nlfq0ar7g";
      };
      nativeBuildInputs = [
        cmake
      ];
      # phases = [ "installPhase" "fixupPhase" ];
      # installPhase = ''
      #   runHook preInstall
      #   echo out=$out
      #   mkdir -p $out
      #   set $srcs
      #   tar -xf $1 -C $out --strip-components=1
      #   tar -xf $2 -C $out
      #   tar -xf $3 -C $out
      #   (cd $out; bash ./setup.sh -h)
      #   rm $out/zephyr-sdk-x86_64-hosttools-standalone-0.9.sh
      #   runHook postInstall
      # '';
    };
  zephyr = pkgs.callPackage new-zephyr-pkg { };
in
mkShell {
  buildInputs = [
    python311Packages.west
    zephyr-sdk
  ];

  # shellHook = ''
  #   export ZEPHYR_SDK_INSTALL_DIR=${zephyr-sdk}
  #   export PATH=$PATH:${zephyr-sdk}/arm-zephyr-eabi/bin
  # '';
}
#
# # Basic configuration for Zephyr development.
# { pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.05.tar.gz") { } }:
# let
#
#   zephyr-sdk = pkgs.callPackage new-zephyr-sdk-pkg { };
#
#   packages = with pkgs; [
#
#     zephyr-sdk
#   ];
# in
# pkgs.mkShell {
#   nativeBuildInputs = [ packages ];
#
#   # For Zephyr work, we need to initialize some environment variables,
#   # and then invoke the zephyr setup script.
#   shellHook = ''
#     export ZEPHYR_SDK_INSTALL_DIR=${zephyr-sdk}
#     export PATH=$PATH:${zephyr-sdk}/arm-zephyr-eabi/bin
#     unset CFLAGS
#     unset LDFLAGS
#     source ./workspace/zephyr/zephyr-env.sh
#   '';
# }
