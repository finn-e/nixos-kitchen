#TODO: add description

{ config, lib, pkgs, ... }:

{
	imports = 
	[
		./home-manager/nixos.nix
		./impermanence/nixos.nix
		./impermanence/home-manager.nix
	];

	environment.persistence."/stay" = {
		directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/nixos"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/log"
      ];
    files = [
      "/etc/machine-id"
    ];
	};


}