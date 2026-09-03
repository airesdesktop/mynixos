{ config, pkgs, lib, ... }:

{
  # ===== Display manager =========================================================================
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.excludePackages = [pkgs.xterm];
  # ===============================================================================================

  # ===== Desktop manager =========================================================================
    services.desktopManager.plasma6.enable = true;

    # ----- Setting ----------------------------------------------------------------------------
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
      
        # ..... Removing .....
          kate
          qrca
          spectacle
          # drkonqi
          kwrited
        # ....................
    
        # ..... Optional .....
          # Uncomment the line below if dolphin or discover are not needed.
            # dolphin   # <- This line.
            # discover  # <- This line.
        # ....................

      ];
    # ------------------------------------------------------------------------------------------

  # ===============================================================================================

  # ===== User-based Setup (Specialization) =======================================================
    services.logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "lock";
    };

    hardware.graphics = {

      # ----- Drivers ----------------------------------------------------------------------------
        enable = true;

        extraPackages = with pkgs; [
          # .........................................................................
            intel-media-driver      # Driver moderno essencial para o i5-1235U (iHD)
            intel-compute-runtime   # Habilita suporte a OpenCL
            vpl-gpu-rt              # Suporte para processamento
            # intel-media-sdk       # SDK de media legada.
          # .........................................................................
        ];
        
      # ------------------------------------------------------------------------------------------

    };

    # ===== NixOS Power Management =====
      powerManagement.enable = true;
      powerManagement.powertop.enable = true;
      services.thermald.enable = true;
      services.power-profiles-daemon.enable = false;
      services.auto-cpufreq.enable = true;
      services.auto-cpufreq.settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          turbo = "never";
        };
      };
    # ==================================

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
     # ==============================================================================================

    # ----- Power profiles ---------------------------------------------------------------------
      # services.power-profiles-daemon.enable = true;
    # ------------------------------------------------------------------------------------------

    # ===== NVME ====================================================================================
      services.fstrim.enable = true;
    # ===============================================================================================

    # ===== Swappiness =====
      boot.kernel.sysctl = {
        "vm.swappiness" = 10;
      };
    # ======================

    # ===== Kernel ==================================================================================
      boot.kernelModules = ["ideapad_acpi"];
    # ===============================================================================================

  # ===============================================================================================
}