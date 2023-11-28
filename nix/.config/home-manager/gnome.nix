{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    # Keyboard
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:ctrl_modifier" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      switch-to-workspace-left = [ "<Control><Super>Left" ];
      switch-to-workspace-right = [ "<Control><Super>Right" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      screensaver = [ "<Shift><Super>l" ];
      www = [ "<Super>b" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>x";
      command = "kitty";
      name = "Terminal";
    };

    # Theming
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      focus-mode = "sloppy";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "default";
      cursor-theme = "Catppuccin-Mocha-Lavender-Cursors";
      gtk-theme = "Catppuccin-Mocha-Standard-Lavender-Dark";
      icon-theme = "Papirus-Dark";
      show-battery-percentage = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      experimental-features = [ "scale-monitor-framebuffer" ];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      /* enabled-extensions = [ */
      /*   "launch-new-instance@gnome-shell-extensions.gcampax.github.com" */
      /*   "user-theme@gnome-shell-extensions.gcampax.github.com" */
      /*   "tiling-assistant@leleat-on-github" */
      /*   "caffeine@patapon.info" */
      /*   "drive-menu@gnome-shell-extensions.gcampax.github.com" */
      /* ]; */
      enabled-extensions = [
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "cloudflare-warp-toggle@khaled.is-a.dev"
      ];
    };

  };
}
