#TODO: add description

{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

}