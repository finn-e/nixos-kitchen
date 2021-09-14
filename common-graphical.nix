#TODO: add description

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    firefox
    kitty
  ];

  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;
    # Configure keymap in X11
    layout = "us";
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
  };



}