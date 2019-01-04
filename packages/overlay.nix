{ secrets, config }: self: super:
let
  upgrade = package: overrides:
  let
    upgraded = package.overrideAttrs overrides;
    upgradedVersion = (builtins.parseDrvName upgraded.name).version;
    originalVersion =(builtins.parseDrvName package.name).version;

    isDowngrade = (builtins.compareVersions upgradedVersion originalVersion) == -1;

    warn = builtins.trace
      "Warning: ${package.name} downgraded by overlay with ${upgraded.name}.";
    pass = x: x;
  in (if isDowngrade then warn else pass) upgraded;
in {
  # autorandr-configs = self.callPackage ./autorandr-configs { };

  # backlight = self.callPackage ./backlight { };

  # bash-config = self.callPackage ./bash-config { };

  # custom-emacs = self.callPackage ./emacs { };

  # cnijfilter2 = super.cnijfilter2.overrideAttrs (x: {
  #   name = "cnijfilter2-5.60";
  #   src = self.fetchzip {
  #     url = "http://gdlp01.c-wss.com/gds/0/0100009490/01/cnijfilter2-source-5.60-1.tar.gz";
  #     sha256 = "0yagz840g28kz0cyy3abbv4h2imw1pia1hzsqacjsmvz4wdhy14k";
  #   };
  # });

  dunst_config = self.callPackage ./dunst { };

  email = self.callPackage ./email { };
  spacemacs = self.callPackage ./spacemacs { inherit config; };

  direnv-hook = self.callPackage ./direnv-hook { };

  # gitconfig = self.callPackage ./gitconfig { };

  gnupgconfig = self.callPackage ./gnupgconfig { };

  # helvetica = self.callPackage ./helvetica { inherit secrets; };

  # i3config = self.callPackage ./i3config { inherit secrets; };

  # is-nix-channel-up-to-date = self.callPackage ./is-nix-channel-up-to-date { };

  # did-graham-commit-his-repos = self.callPackage ./did-graham-commit-his-repos { };

  # motd-massive = self.callPackage ./motd { };

  mutate = self.callPackage ./mutate { };

  # nixpkgs-maintainer-tools = self.callPackage ./nixpkgs-maintainer-tools { };

  # nixpkgs-pre-push = self.callPackage ./nixpkgs-pre-push { };

  notmuch = upgrade super.notmuch (self.callPackage ./notmuch { });

  # passff-host = self.callPackage ./passff-host { };

  screenshot = self.callPackage ./screenshot { };

  systemd-lock-handler = self.callPackage ./systemd-lock-handler { };

  timeout_tcl = self.callPackage ./timeout { };

  volume = self.callPackage ./volume { };

  # zsh-config = self.callPackage ./zsh-config { };
}
