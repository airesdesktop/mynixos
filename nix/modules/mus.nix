{ config, pkgs, lib, ... }:

# TOOLS FOR REAL-TIME AUDIO ON NIXOS
# project from: https://github.com/musnix/musnix

# YOUR USER MUST HAVE extragroups: [ "audio" ]

# ===== GETTING REPO =====
  let
    # Fetch the remote repository at a specific commit hash
    musnix = builtins.fetchGit {
      url = "https://github.com/musnix/musnix.git";
      rev = "8548782f0d1d0928daa3fffde8a008f72219a3f3";
    };
  in
# ========================

{
  # ===== IMPORTING MUSNIX =====
    imports = [ "${musnix}" ];
  # ============================

  musnix.enable = true; # enable musnix, check documentation for checking what it does
  musnix.ffado.enable = true; # firewire audio drivers
  musnix.rtcqs.enable = true; # audio tips on terminal

  # musnix.kernel.realtime = true; # ENABLING REQUIRES COMPILING THE REALTIME KERNEL
  # CAN MESS WITH DRIVERS, SO USE WITH CAUTION

  # musnix.kernel.packages = pkgs.linuxPackages;
}