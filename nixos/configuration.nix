# Example NixOS configuration.
# Edit to match your hardware and preferences, then run:
#   task nixos:link    # symlink into /etc/nixos
#   sudo nixos-rebuild switch

{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  # User
  users.users.adilet = {
    isNormalUser = true;
    description = "Adilet";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    bat
    btop
    fd
    fish
    fzf
    git
    go
    pandoc
    ripgrep
    stow
    uv
    zoxide
  ];

  # Enable fish shell system-wide
  programs.fish.enable = true;

  # Nerd font (JetBrains Mono)
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  system.stateVersion = "24.11";
}
