{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  packages = [
    (pkgs.python3.withPackages(py: with py; [
      numpy
      requests
      pandas
    ]))
  ];

}