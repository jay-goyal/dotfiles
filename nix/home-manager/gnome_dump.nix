# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/blueman/general" = {
      window-properties = [ 943 1020 0 0 ];
    };

    "org/blueman/plugins/powermanager" = {
      auto-power-on = "@mb true";
    };

    "org/blueman/plugins/recentconns" = {
      recent-connections = "[{'adapter': '48:E7:DA:A9:A5:2C', 'address': '00:1B:66:2D:BD:DA', 'alias': 'CX Plus True Wireless', 'icon': 'audio-headset', 'name': 'Audio and input profiles', 'uuid': '00000000-0000-0000-0000-000000000000', 'time': '1696523381.7705772', 'device': '/org/bluez/hci0/dev_00_1B_66_2D_BD_DA'}, {'adapter': '48:E7:DA:A9:A5:2C', 'address': 'C9:5C:FD:B5:88:2D', 'alias': 'Tribit MAXSound Plus', 'icon': 'audio-headset', 'name': 'Audio and input profiles', 'uuid': '00000000-0000-0000-0000-000000000000', 'time': '1696657279.4895256', 'device': '/org/bluez/hci0/dev_C9_5C_FD_B5_88_2D'}, {'adapter': '48:E7:DA:A9:A5:2C', 'address': 'C9:5C:FD:31:79:B8', 'alias': 'Tribit MAXSound Plus', 'icon': 'audio-headset', 'name': 'Audio and input profiles', 'uuid': '00000000-0000-0000-0000-000000000000', 'time': '1696906749.4632382', 'device': '/org/bluez/hci0/dev_C9_5C_FD_31_79_B8'}]";
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 652 482 ];
    };

    "org/gnome/calendar" = {
      active-view = "week";
      week-view-zoom-level = 0.334;
      window-maximized = true;
      window-size = mkTuple [ 768 600 ];
    };

    "org/gnome/control-center" = {
      last-panel = "wifi";
      window-state = mkTuple [ 980 640 ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/jay/.local/share/backgrounds/2023-10-10-08-46-47-15.jpg";
      picture-uri-dark = "file:///home/jay/.local/share/backgrounds/2023-10-10-08-46-47-15.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:ctrl_modifier" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "default";
      cursor-theme = "Catppuccin-Mocha-Lavender-Cursors";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "Catppuccin-Mocha-Standard-Lavender-Dark";
      icon-theme = "Papirus-Dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "gnome-network-panel" "org-gnome-nautilus" "org-gnome-evolution-alarm-notify" "firefox" ];
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evolution-alarm-notify" = {
      application-id = "org.gnome.Evolution-alarm-notify.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.39370078740157477;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "enabled";
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/jay/.local/share/backgrounds/2023-10-10-08-46-47-15.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      maximize = [];
      switch-to-workspace-left = [ "<Control><Super>Left" ];
      switch-to-workspace-right = [ "<Control><Super>Right" ];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      focus-mode = "sloppy";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/evolution-data-server/calendar" = {
      notify-window-height = 265;
      notify-window-paned-position = 63;
      notify-window-width = 231;
      notify-window-x = 103;
      notify-window-y = 103;
      reminders-past = [];
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      experimental-features = [ "scale-monitor-framebuffer" ];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "medium";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1126 614 ];
    };

    "org/gnome/nm-applet/eap/0528914f-ceea-40bd-bcfd-333f48372a42" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/2afb37e9-18ca-481f-90bd-7fdd49d43392" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/96ceb626-8250-4fa9-bd48-e4a368dd2794" = {
      ignore-ca-cert = true;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
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

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'blueman-manager.desktop': <{'position': <0>}>, 'discord.desktop': <{'position': <1>}>, 'org.gnome.Extensions.desktop': <{'position': <2>}>, 'firefox.desktop': <{'position': <3>}>, 'gtkwave.desktop': <{'position': <4>}>, 'htop.desktop': <{'position': <5>}>, 'org.gnome.Calculator.desktop': <{'position': <6>}>, 'kitty.desktop': <{'position': <7>}>, 'nvim.desktop': <{'position': <8>}>, 'org.gnome.Settings.desktop': <{'position': <9>}>, 'gnome-system-monitor.desktop': <{'position': <10>}>, 'nixos-manual.desktop': <{'position': <11>}>, 'nvidia-settings.desktop': <{'position': <12>}>, 'polychromatic.desktop': <{'position': <13>}>, 'Utilities': <{'position': <14>}>, 'rog-control-center.desktop': <{'position': <15>}>, 'slack.desktop': <{'position': <16>}>, 'yelp.desktop': <{'position': <17>}>, 'org.gnome.TextEditor.desktop': <{'position': <18>}>, 'virt-manager.desktop': <{'position': <19>}>, 'xterm.desktop': <{'position': <20>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [ "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "caffeine@patapon.info" "drive-menu@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "kitty.desktop" "firefox.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "44.4";
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 1;
    };

    "org/gnome/shell/extensions/mediacontrols" = {
      mouse-actions = [ "toggle_play" "toggle_menu" "none" "none" "none" "none" "none" "none" ];
    };

    "org/gnome/shell/extensions/quick-settings-tweaks" = {
      list-buttons = "[{\"name\":\"SystemItem\",\"label\":null,\"visible\":true},{\"name\":\"OutputStreamSlider\",\"label\":null,\"visible\":true},{\"name\":\"InputStreamSlider\",\"label\":null,\"visible\":false},{\"name\":\"St_BoxLayout\",\"label\":null,\"visible\":true},{\"name\":\"BrightnessItem\",\"label\":null,\"visible\":true},{\"name\":\"NMWiredToggle\",\"label\":null,\"visible\":false},{\"name\":\"NMWirelessToggle\",\"label\":\"Wi-Fi\",\"visible\":true},{\"name\":\"NMModemToggle\",\"label\":null,\"visible\":false},{\"name\":\"NMBluetoothToggle\",\"label\":null,\"visible\":false},{\"name\":\"NMVpnToggle\",\"label\":\"VPN\",\"visible\":true},{\"name\":\"BluetoothToggle\",\"label\":\"Bluetooth\",\"visible\":true},{\"name\":\"PowerProfilesToggle\",\"label\":\"Power Mode\",\"visible\":true},{\"name\":\"NightLightToggle\",\"label\":\"Night Light\",\"visible\":true},{\"name\":\"DarkModeToggle\",\"label\":\"Dark Style\",\"visible\":true},{\"name\":\"RfkillToggle\",\"label\":\"Airplane Mode\",\"visible\":true},{\"name\":\"RotationToggle\",\"label\":\"Auto Rotate\",\"visible\":false},{\"name\":\"CaffeineToggle\",\"label\":\"Caffeine\",\"visible\":true},{\"name\":\"DndQuickToggle\",\"label\":\"Do Not Disturb\",\"visible\":true},{\"name\":\"BackgroundAppsToggle\",\"label\":\"No Background Apps\",\"visible\":false},{\"name\":\"MediaSection\",\"label\":null,\"visible\":false},{\"name\":\"Notifications\",\"label\":null,\"visible\":true}]";
    };

    "org/gnome/shell/extensions/space-iflow-randomwallpaper" = {
      source = "genericJSON";
      timer-last-trigger = mkInt64 0;
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      activate-layout0 = [];
      activate-layout1 = [];
      activate-layout2 = [];
      activate-layout3 = [];
      active-window-hint = 1;
      active-window-hint-color = "rgb(180,190,254)";
      auto-tile = [];
      center-window = [];
      debugging-free-rects = [];
      debugging-show-tiled-rects = [];
      default-move-mode = 0;
      dynamic-keybinding-behavior = 0;
      import-layout-examples = false;
      last-version-installed = 42;
      overridden-settings = "{'org.gnome.mutter.edge-tiling': <true>, 'org.gnome.desktop.wm.keybindings.maximize': <@mb nothing>, 'org.gnome.desktop.wm.keybindings.unmaximize': <@mb nothing>, 'org.gnome.mutter.keybindings.toggle-tiled-left': <@mb nothing>, 'org.gnome.mutter.keybindings.toggle-tiled-right': <@mb nothing>}";
      restore-window = [ "<Super>Down" ];
      search-popup-layout = [];
      single-screen-gap = 0;
      tile-bottom-half = [ "<Super>KP_2" ];
      tile-bottom-half-ignore-ta = [];
      tile-bottomleft-quarter = [ "<Super>KP_1" ];
      tile-bottomleft-quarter-ignore-ta = [];
      tile-bottomright-quarter = [ "<Super>KP_3" ];
      tile-bottomright-quarter-ignore-ta = [];
      tile-edit-mode = [];
      tile-left-half = [ "<Super>Left" "<Super>KP_4" ];
      tile-left-half-ignore-ta = [];
      tile-maximize = [ "<Super>Up" "<Super>KP_5" ];
      tile-maximize-horizontally = [];
      tile-maximize-vertically = [];
      tile-right-half = [ "<Super>Right" "<Super>KP_6" ];
      tile-right-half-ignore-ta = [];
      tile-top-half = [ "<Super>KP_8" ];
      tile-top-half-ignore-ta = [];
      tile-topleft-quarter = [ "<Super>KP_7" ];
      tile-topleft-quarter-ignore-ta = [];
      tile-topright-quarter = [ "<Super>KP_9" ];
      tile-topright-quarter-ignore-ta = [];
      toggle-always-on-top = [];
      toggle-tiling-popup = [];
      window-gap = 0;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 841 328 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 179;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 103 103 ];
      window-size = mkTuple [ 1516 756 ];
    };

    "org/nemo/window-state" = {
      maximized = true;
      side-pane-view = "places";
      sidebar-bookmark-breakpoint = 0;
      start-with-sidebar = true;
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 550;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

  };
}
