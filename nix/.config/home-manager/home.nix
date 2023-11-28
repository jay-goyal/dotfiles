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
    vscode
    htop
    tmux
    virt-manager
    geogebra
    obs-studio
    vlc
    # wofi
    # networkmanagerapplet
    # blueman
    # pavucontrol
    slack
    gh
    discord
    polychromatic
    youtube-music
    zoom-us
    calibre
    obsidian
    # dunst

    # Dev Utils
    rustup
    nodejs
    corepack
    bun
    zig
    verilog
    gtkwave
    distrobox
    zig

    # Utilities
    eza
    stow
    wl-clipboard
    qemu
    ripgrep
    fzf
    bc

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
    cloudflare-warp-toggle
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
    # Add glibc, clang, glib and other headers to bindgen search path
    BINDGEN_EXTRA_CLANG_ARGS =  ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include ${pkgs.glib.dev}/include/glib-2.0 ${pkgs.glib.out}/lib/glib-2.0/include/"'';
    # Includes with normal include path
    # (builtins.map (a: ''-I"${a}/include"'') [
      # add dev libraries here (e.g. pkgs.libvmi.dev)
      # pkgs.glibc.dev 
    # ])
    # Includes with special directory paths
    # ++ [
      # ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
      # ''-I"${pkgs.glib.dev}/include/glib-2.0"''
      # ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
    # ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.waybar.enable = true;
}
