{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # ===== GETTING PYTHON =====
  packages = [
    (python3.withPackages(py: with py; [
      
      # ----- PYTHON PACKAGES -----
        numpy
        requests
        pandas
      # ---------------------------
      
    ]))
  ];
  # ==========================
  
  # ===== VARIABLES =====
  environment.variables = {
    PYTHONDONTWRITEBYTECODE = "1";
  };
  # =====================
}