# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_hcd" "ehci_pci" "ahci" "usbhid" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a1463ee6-c35a-4264-bf23-607a32644fd5";
      fsType = "ext4";
    };

#   fileSystems."/media" =
#     { device = "/dev/disk/by-uuid/180e6c78-a4ca-4f2e-841f-94e42a3b9522";
#       fsType = "ext3";
#     };

  swapDevices = [ ];

  nix.maxJobs = 8;
}