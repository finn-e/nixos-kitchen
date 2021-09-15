#TODO: add description

{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    fish # rather put something 2 places than none
    git
  	nano
    ncdu # for traversing the directory tree to find things that need persistence
    neovim
  ];

  hardware.enableAllFirmware = true;
  hardware.pulseaudio.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  networking.useDHCP = false;

  # allow unfree packages like sublime3
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  programs.fuse.userAllowOther = true; # so root can access user impermanence files

  # Enable CUPS to print documents.
  services.printing.enable = true;
  sound.enable = true;

  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable/";

  #yuck, systemd
  systemd.enableEmergencyMode = false;

  time.timeZone = "America/Louisville";

  users = {
    mutableUsers = false;
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
      fin = {
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        isNormalUser = true;
        shell = pkgs.fish;
      };
      root = {
        shell = pkgs.fish;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}