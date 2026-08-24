{ config, pkgs, lib, ... }:

{
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
          jack.enable = true;
        # ................

        # ..... More .....
          # use the example session manager (no others are packaged yet so this is enabled by default,
          # no need to redefine it in your config for now)
          # media-session.enable = true;
        # ................

      };
    # -----------------
  # ====================
}