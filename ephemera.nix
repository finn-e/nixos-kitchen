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

	};


}