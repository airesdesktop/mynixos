{ config, pkgs, lib, ... }:

{
  # ===== Allow unfree packages =====
    nixpkgs.config.allowUnfree = true;
  # =================================

  # ===== Explorer =====
    programs.firefox = {

      # ----- Getting -----
        enable = true;
        package = pkgs.firefox-esr;
      # -------------------

      # ----- Setting -----
        # !!!!! TO WORK ON !!!!!
      # -------------------

    };
  # ====================

  # ===== Steam =====
    programs.steam = {

      # ----- Getting -----
        enable = true;
        # packages = pkgs.millennium-steam;
      # -------------------
        
      # ----- Setting -----
        remotePlay.openFirewall = true; # Abra as portas no firewall para o Steam Remote Play
        dedicatedServer.openFirewall = true; # Abra as portas no firewall para o Source Dedicated Server
      # -------------------

    };
  # =================

  # ===== AppImages =====
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
  # =====================

  # ===== DCONF =====
    # programs.dconf.enable = true;
  # =================

  # ;;;;; Configuration with no setup ;;;;;

  environment.systemPackages = with pkgs; [
    
    # ===== Default =====

      # ----- NixOS Tools -----
        nix-search-cli
        nix-inspect
        home-manager
      # ----------------------
      
      fastfetch
      bazaar
      
      # ----- wm -----
        # niri
      # --------------

      # ----- File browser -----
        superfile
      # ------------------------

      # ----- Editor -----
        fresh-editor
        avidemux
        openshot-qt
        flowblade
        pitivi
      # ------------------

      # ----- GNOME Settings -----
        # gnome-disk-utility
        # gnome-secrets
        # gsettings-desktop-schemas
      # --------------------------

    # ===================

    # ===== Essentials =====
      git
      vlc
      sublime
      thunderbird
      # minitube
      smplayer
      docker
      pipe-viewer
      gtk-pipe-viewer
      youtube-viewer
      youtube-tui
      yt-dlp
    # ======================

    # ===== Nix Editing =====
      direnv
      vscodium
      neovim
    # =======================

    # ===== Python configuration =====
      python3
        # ----- Packages -----
          # python313Packages.textual-dev
          # python313Packages.jedi
        # --------------------
        # ----- IDE -----
          # spyder
        # ---------------
    # ================================

    # ===== Java configuration =====
      openjdk
        # ----- IDE -----
          # netbeans
        # ---------------
    # ==============================

    # ===== Cargo =====
      rustc
      cmake
      #dart
      #vimPlugins.dart-nvim
      #webdev
      ruby
      rubyPackages.sinatra
      clang
      cargo
    # =================

    # ===== KDE =====
      kdePackages.kdevelop
      kdePackages.klevernotes
    # ===============

    # ===== My usual packages =====
      # ----- Terminal -----
        hyfetch
        freshfetch
      # --------------------
      # ----- Printing -----
        orca-slicer
      # --------------------
      # ----- Gaming -----
        steam
        sgdboop
        steamcmd
        steam-tui
      # ------------------
      # ----- Art -----
        blender
        povray
        libresprite
      # ---------------
      # ----- Development -----
        godot
        # bluefish
      # -----------------------
      # ----- Creation -----
        obs-studio
        # ..... OBS Plugins .....
          obs-studio-plugins.waveform
        # .......................
      # --------------------
      # ----- Notes -----
        lockbook
      # -----------------
      # ----- DAW -----
        bitwig-studio
        bespokesynth
        # cardinal
        renoise
        # zrythm
        # ardour
        # qtractor
          # ..... Plugins .....
          # ...................
      # ---------------
    # =============================
      
    # ===== VPN =====
      wireguard-tools
      proton-vpn
      proton-vpn-cli
    # ==================

    # ===== Experimental =====
      # eduke32
      # alephone
    # ========================
  
  ];

  # ===== Trackers =====
    # services.tracker.enable = true;
    # services.tracker-miners.enable = true;
  # ====================

  # ===== Nautilus Fixes =====
    # services.gvfs.enable = true;
    # services.dbus.enable = true;
    # services.gnome.at-spi2-core.enable = true;
    # services.gnome.tinysparql.enable = true;
    # services.gnome.localsearch.enable = true;
  # ==========================

  # ===== Flatpak =====
    services.flatpak.enable = true;
  # ===================
}