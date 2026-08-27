{ config, pkgs, lib, ... }:

{
  environment.variables = {
    PYTHONDONTWRITEBYTECODE = "1";
  };
}