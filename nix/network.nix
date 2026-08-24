{ config, pkgs, lib, ... }:

{
  # ===== Network =====
    networking.hostName = "nixos";
    # networking.wireless.enable = true;
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # ----- Setup -----
      networking.networkmanager.enable = true;
      networking.firewall.checkReversePath = false;
    # -----------------
  # ===================
}