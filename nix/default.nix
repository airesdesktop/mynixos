{ config, pkgs, lib, ... }:

{
  # ===== Imports =====
    imports = [
      
      # ----- System nix files -----
        /etc/nixos/hardware-configuration.nix
      # ----------------------------

      # ----- Getting main nix files -----
        ./boot.nix
        ./network.nix
        ./regionalization.nix
        ./desktop.nix
        ./audio.nix
        ./users.nix
        ./specialization.nix
        ./software.nix
      # ---------------------------------

    ];
  # ===================

  # ===== DEFAULT OPTIMIZATIONS =====
    # ----- Timezone -----
      time.timeZone = lib.mkForce null;
      services.tzupdate.enable = true;
    # ---------------------------
    
    # ----- Network -----
      networking.hostName = "nixos";
      networking.wireless.enable = true;
      networking.networkmanager.enable = true;
      networking.firewall.checkReversePath = false;
    # -------------------
    
    nix.settings.auto-optimise-store = true;
  # =================================

  # ===== LEGACY =====
    services.xserver.enable = true;
    services.xserver.excludePackages = [pkgs.xterm];
  # ==================

  # ===== SYSTEM VERSION =====
    system.stateVersion = "26.05"; # Did you read the comment?
  # ==========================

}
