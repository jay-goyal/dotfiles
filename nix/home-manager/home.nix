{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = 
    [
      ./gnome.nix
    ];
  home.username = "jay";
  home.homeDirectory = "/home/jay";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = (with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    (pkgs.nerdfonts.override { fonts = ["FiraCode"]; })

    # Programs
    kitty
    firefox
    neovim
    htop
    tmux
    virt-manager
    geogebra
    obs-studio
    # wofi
    # networkmanagerapplet
    # blueman
    # pavucontrol
    slack
    gh
    discord
    polychromatic
    youtube-music
    # dunst

    # Dev Utils
    rustup
    nodejs
    corepack
    bun
    zig
    verilog
    gtkwave

    # Utilities
    # xdg-user-dirs
    eza
    stow
    wl-clipboard
    qemu
    # inotify-tools
    ripgrep
    fzf
    # feh
    # swaybg
    # swaylock-effects
    # wlogout
    # playerctl
    # brightnessctl
    # xdg-desktop-portal-hyprland
    # gsettings-desktop-schemas

  # Compression Utilities
    unzip
    zip
    p7zip
    unrar
    
    # Shell
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-powerlevel10k
    nitch

    # Theme
    (pkgs.catppuccin-gtk.override {
      accents = [ "lavender" ]; # You can specify multiple accents here to output multiple themes 
      size = "standard";
      tweaks = [ "normal" ]; # You can also specify multiple tweaks here
      variant = "mocha";
    })
    catppuccin-cursors.mochaLavender
    papirus-icon-theme
  ]) ++ (with pkgs.gnome; [
    gnome-tweaks
  ]) ++ (with pkgs.gnomeExtensions; [
    user-themes
    launch-new-instance
    removable-drive-menu
    caffeine
  ]);

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jay/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.waybar.enable = true;
}
