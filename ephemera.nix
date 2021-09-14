#TODO: add description

{ config, lib, pkgs, ... }:
let
#TODO: replace these with fetchGit and versioning
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  };
  impermanence = builtins.fetchTarball {
    url =
      "https://github.com/nix-community/impermanence/archive/master.tar.gz";
  };
in {
	imports = 
	[
		"${home-manager}/nixos"
		"${impermanence}/nixos.nix"
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
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/nix/id_rsa"
    ];
	};

	home-manager.users.fin = { lib, ... }: {
		imports = ["${impermanence}/home-manager.nix"];

		programs.home-manager.enable = true;

    home.persistence."/stay/home/fin" = {
      allowOther = true;
      directories = [
        ".config/fish"
        ".config/sublime-text-3"
        ".gnupg"
        ".local/share/fish"
        ".local/share/keyrings"
        ".mozilla"
        "kitchen"
        "mess"
        "study"
      ];
      files = [
        ".config/gnome-initial-setup-done"
      ];
    };

    home.persistence."/stay/home/fin/study" = {
      allowOther = true;
      directories = [
        "Documents"
        "Music"
        "Pictures"
        "Videos"
      ];
    };
  };
}