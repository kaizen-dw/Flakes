{ config, pkgs, name, stateVersion, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  disko = import ./disko.nix;
  environment = import ./environment.nix { inherit pkgs; };

  networking.hostName = name;
  programs = {
    adb.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
    corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  virtualisation = {
    # waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };
  };

  security = {
    polkit.enable = true;
    pam.services.swaylock = {};
  };

  services = {
    blueman.enable = true;
    create_ap = {
      enable = true;
      settings = {
        SSID = "wolly";
        PASSPHRASE = "1234qwer";
        WIFI_IFACE = "wlp1s0";
        INTERNET_IFACE = "enp3s0f0";
      };
    };

    gvfs.enable = true;
    upower.enable = true;
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
  };

  hardware = {
    opentabletdriver.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  boot = {
    blacklistedKernelModules = [ "k10temp" ];
    extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;
  system.stateVersion = stateVersion;
}
