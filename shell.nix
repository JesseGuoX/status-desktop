{ pkgs ? import <nixpkgs-unstable> { } }:

let
  qtCustom = with pkgs.qt515;
    env "qt-custom-${qtbase.version}" ([
      qtbase
      qtdeclarative
      qtlottie
      qtmultimedia
      qtquickcontrols
      qtquickcontrols2
      qtsvg
      qttools
      qtwebengine
    ]);
in pkgs.mkShell {
  name = "status-desktop-build-shell";

  buildInputs = with pkgs; [
    bash curl wget git file unzip jq lsb-release
    cmake gnumake pkg-config gnugrep qtCustom
    pcre nss pcsclite extra-cmake-modules
    xorg.libxcb xorg.libX11 libxkbcommon
  ] ++ (with gst_all_1; [
    gst-libav gstreamer
    gst-plugins-bad  gst-plugins-base
    gst-plugins-good gst-plugins-ugly
  ]);

  # Avoid terminal issues.
  TERM = "xterm";
  LANG = "en_US.UTF-8";
  LANGUAGE = "en_US.UTF-8";

  QTDIR = qtCustom;

  shellHook = ''
    export MAKEFLAGS="-j$NIX_BUILD_CORES"
  '';
}
