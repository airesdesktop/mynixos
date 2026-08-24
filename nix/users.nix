{ config, pkgs, lib, ... }:

{
  # ===== Users =====
    users.users."jellybean" = {

      # ----- Setup -----
        isNormalUser = true;
        description = "justcallmeaires";
        extraGroups = [ "owner" ];
      # -----------------

    };
  # ============================
}