#TODO: add description

{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    firefox-wayland
    foot
  ];



}