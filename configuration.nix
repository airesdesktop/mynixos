{ config, pkgs, lib, ... }:


# ||||| CONFIGURATION |||||


{

  # ===== Imports =====
    imports = [./hardware-configuration.nix];
    # nixpkgs.overlays = [inputs.millennium.overlays.default];
  # ===================

  # ===== Bootloader =====
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  # ======================

  # ===== Network =====
    networking.hostName = "Ideapad";
    # networking.wireless.enable = true;
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # ----- Setup -----
      networking.networkmanager.enable = true;
      networking.firewall.checkReversePath = false;
    # -----------------
  # ===================

  # ===== Regionalization =====
    time.timeZone = "America/Fortaleza";
  # ===========================

  
  # ||||| DESKTOP ENVIROMENT |||||


  # ===== Plasma 6 =====
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # ----- Setting -----
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
      
        # ..... Removing .....
          kate
          qrca
          spectacle
          drkonqi
          kwrited
        # ....................
    
        # ..... Optional .....
          # Uncomment the line below if dolphin or discover are not needed.
            # dolphin   # <- This line.
          discover  # <- This line.
        # ....................

      ];
    # -------------------

  # ===================

  # ===== GNOME =====
    # services.displayManager.gdm.enable = true; # Gets login page.
    services.desktopManager.gnome.enable = true; # Gets desktop enviroment.

    # ----- Excluding packages -----
      services.gnome.core-apps.enable = true;
      services.gnome.core-developer-tools.enable = true;
      services.gnome.rygel.enable = false;
      # services.gnome.games.enable = false;
      environment.gnome.excludePackages = with pkgs; [decibels snapshot rygel gnome-connections epiphany loupe d-spy totem];
    # ------------------------------

  # ==================

  # ===== COSMIC =====
    # services.displayManager.cosmic-greeter.enable = true;
    # services.desktopManager.cosmic.enable = true;
  # ==================

  
  # ||||| Audio |||||


  # ===== Pipewire =====
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
  
    # ----- Setup -----
      services.pipewire = {
        
        # ..... Enable .....
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        # ..................

        # ..... JACK .....
          # If you want to use JACK applications, uncomment this
          # jack.enable = true;
        # ................

        # ..... More .....
          # use the example session manager (no others are packaged yet so this is enabled by default,
          # no need to redefine it in your config for now)
          # media-session.enable = true;
        # ................

      };
    # -----------------
  # ====================


  # ||||| USERS |||||


  # ===== Basic User Setup =====
    users.users."jellybean" = {

      # ----- Setup -----
        isNormalUser = true;
        description = "justcallmeaires";
        extraGroups = [ "networkmanager" "wheel" ];
      # -----------------

    };
  # ============================

  # ===== User-based Setup (Specialization) =====
    hardware.graphics = {

      # ----- Drivers -----
        enable = true;

        extraPackages = with pkgs; [
          # .........................................................................
            intel-media-driver      # Driver moderno essencial para o i5-1235U (iHD)
            intel-compute-runtime   # Habilita suporte a OpenCL
            vpl-gpu-rt              # Suporte para processamento
            # intel-media-sdk       # SDK de media legada.
          # .........................................................................
        ];
      # -------------------

    };

    # ===== Thermald =====
      # services.thermald.enable = true;
    # ====================

    # ===== Intel Microcodes (Disable if wary). =====
      hardware.cpu.intel.updateMicrocode = true;
    # ===============================================

    # ===== Ananicy =====
      services.ananicy = {
      
        # ----- Enable -----
        enable = true;
        package = pkgs.ananicy-cpp;
        # ------------------
      
      };
     # ==================

    # ===== Power profiles =====
      services.power-profiles-daemon.enable = true;
    # ==========================

    # ===== NVME =====
      services.fstrim.enable = true;
    # ================

    # ===== Kernel =====
      boot.kernelModules = ["ideapad_acpi"];
    # ==================


  # ||||| GETTING PACKAGES |||||


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

  # ===== DCONF =====
    # programs.dconf.enable = true;
  # =================

  # ;;;;; Configuration with no setup ;;;;;

  environment.systemPackages = with pkgs; [
    
    # ===== Default =====

      # ----- NixOS Tools -----
        nix-search-cli
        nix-inspect
      # ----------------------
      
      fastfetch
      bazaar
      micro

      # ----- File browser -----
        superfile
      # ------------------------

      # ----- Editor -----
        fresh-editor
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
    # ======================

    # ===== Nix Editing =====
      direnv
      vscodium
      neovim
    # =======================

    # ===== Python configuration =====
      python3
        # ----- Packages -----
          python313Packages.textual-dev
        # --------------------
        # ----- IDE -----
          spyder
          thonny
        # ---------------
    # ================================

    # ===== Java configuration =====
      openjdk
        # ----- IDE -----
          netbeans
        # ---------------
    # ==============================

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
      # ------------------
      # ----- Art -----
        blender
        libresprite
      # ---------------
      # ----- Development -----
        godot
        bluefish
      # -----------------------
      # ----- Design -----
        penpot-desktop
        lunacy
      # ------------------
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
        cardinal
        renoise
        zrythm
        ardour
        qtractor
        muse
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
  
  # ===== Allow unfree packages =====
    nixpkgs.config.allowUnfree = true;
  # =================================
}
