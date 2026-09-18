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

      # ------------ Python -------------
        ./py.nix
      # ---------------------------------

    ];
  # ===================

  # ===== DEFAULT OPTIMIZATIONS =====
    nix.settings.auto-optimise-store = true;
  # =================================
  
  # ===== SYSTEM VERSION =====
    system.stateVersion = "26.05"; # Did you read the comment?
  # ==========================

}
