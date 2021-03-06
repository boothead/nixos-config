{ config, lib, pkgs, ... }:

with lib;

{
  options.programs.spacemacsFontSize = mkOption {
    default = 22;
    type = types.int;
    description = ''
      What font size to set in .spacemacs
    '';
    };
}
