# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./vfio.nix
    ./nvidia.nix
    ./asus.nix
  ];

  # Bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
     enable = true;
     useOSProber = true;
     device = "nodev";
     efiSupport = true;
     default = "saved";
    };
  };


  specialisation."VFIO".configuration = {
    system.nixos.tags = [ "with-vfio" ];
    vfio.enable = true;
  };

  networking.hostName = "jay-laptop-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Networking
  networking.networkmanager.enable = true;
  # services.openvpn.servers = {
    # oracle  = { 
      # config = '' config /home/jay/openvpn/oracle.conf ''; 
      # autoStart = false;
    # };
  # };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Lid Close and Power Button Behavior
  services.logind = {
    lidSwitch = "hibernate";
    powerKey = "poweroff";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # OpenRazer
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ "jay" ];

  # GVFS
  services.gvfs.enable = true;

  # Greeter
  # services.greetd = {
    # enable = true;
    # settings = {
      # default_session = {
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
	# user = "jay";
      # };
    # };
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jay = {
    isNormalUser = true;
    description = "Jay Goyal";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "libvirt"];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    bluez
    glibc
    gcc
    binutils
    gnumake
    cmake
    killall
    git
    openrazer-daemon
    glib
    ntfs3g
    pciutils
  ];

  # Hyprland
  # programs.hyprland.enable = true;
  # programs.waybar = {
    # enable = true;
  # };
  # security.pam.services.swaylock = {};

  # GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    baobab
    simple-scan
    seahorse
    gnome-calendar
    gnome-clocks
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-weather
  ]);

  # Shell
  programs.zsh.enable = true;

  # Pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Libvirt
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      runAsRoot = false;
    };
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      roboto
      roboto-mono
      roboto-serif
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["Roboto Mono"];
      };
    };
  };

  # Garbage Collection
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 8d";

  system.stateVersion = "23.05"; # Did you read the comment?

}
