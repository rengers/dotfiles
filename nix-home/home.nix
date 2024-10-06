{ config, inputs, pkgs, ... }:

let
    system = "x86_64-linux";
    unstable = import inputs.unstable {inherit system; };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rengers";
  home.homeDirectory = "/home/rengers";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    #unstable.alacritty
    pkgs.alacritty
    pkgs.alsa-utils
    pkgs.docker
    pkgs.gdb
    pkgs.nmap
    pkgs.tmux
    pkgs.zsh
    pkgs.coreutils # Ensures basic utilities are available in your user environment

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      cp      = "cp -iv";
      nupdate = "cd /etc/nixos && sudo nix flake update && cd -";
      nswitch = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#nixos";
      gs = "git status";
      gd = "git diff";
      gc = "git commit";
      sz = "source ~/.zshrc";
      nim = "nvim";
      ez = "nim ~/.zshrc";
      da = "direnv allow";
      awswho = "aws sts get-caller-identity";
    };
    history = {
      size = 10000;
      extended = true;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra= ''
      #bindkey '^R' history-incremental-search-backward
      bindkey -e
      # Navigate words with ctrl+arrow keys
      bindkey '^[Oc' forward-word                                     #
      bindkey '^[Od' backward-word                                    #
      bindkey '^[[1;5D' backward-word                                 #
      bindkey '^[[1;5C' forward-word                                  #
      bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
      bindkey '^[[Z' undo                                             # Shift+tab undo last action
      bindkey "\e[3~" delete-char                                     # bind delete to delete

      # Load rust
      if [ -f $HOME/.cargo/env ]; then
        source $HOME/.cargo/env
      fi
    '';
      #bindkey '^I' history-incremental-search-forward
  };

  programs.fzf.enable = true;

  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
    #unstable.tmuxPlugins.catppuccin
     tmuxPlugins.catppuccin
    ];
    extraConfig = "";

  };

  # Starship prompt setup
  programs.starship = {
    enable = true;
    settings =
      let
        lib = pkgs.lib;
        formatString = lib.concatStrings [
      "[](surface0)$os"
      "$custom"
      #"[](bg:surface0)"
      "[](bg:peach fg:surface0)"
      "$directory[](fg:peach bg:green)"
      "$git_branch$git_status"
      "$git_metrics[](fg:green bg:teal)"
      "$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$ruby$rust$scala[](fg:teal bg:blue)"
      "$docker_context$nix_shell$aws[](fg:blue bg:surface0) "
      #"$line_break"
      #"$character"
      ];
      in{
      format = "${formatString}";

      right_format ="[](surface0)$character[](bg:surface0)$cmd_duration$time";
      add_newline = false;

      username = {
        show_always = true;
        style_user = "bg:surface0 fg:text";
        style_root = "bg:surface0 fg:text";
        format = "[$user ]($style)";
        disabled = false;
      };

      os = {
        style = "bg:surface0";
        disabled = false;
        symbols = {
          "Macos" = " ";
          #"NixOS" = " ";
          #"NixOS" = "❄️";
        };
      };

      custom.ssh_no_keys = {
        disabled = false;
          description = "SSH missing keys";
          when = "ssh-add -l | grep -q 'no identities'";
          command = "echo 🚫";
          format = "[$symbol$output]($style)";
          shell = ["bash" "--noprofile" "--norc"];
          symbol = "🔑";
          style = "bold fg:red bg:surface0";
      };

      custom.ssh_keys = {
        disabled = false;
        description = "SSH key count";
        when = "ssh-add -l | grep -v -q 'no identities'";
        command = "ssh-add -l | grep -v 'no identities' | wc -l";
        format = "[$symbol$output]($style)";
        shell = ["bash" "--noprofile" "--norc"];
        symbol = "🔑";
        style = "bold fg:green bg:surface0";
      };

      directory = {
        style = "fg:mantle bg:peach";
        #format = "[ $path ]($style)";
        format = "[  $path ]($style)[$read_only]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
        substitutions = {
          "Documents" = "󰈙";
          "Downloads" = "";
          "Music" = "";
          "Pictures" = "";
          "Developer" = "󰲋 ";
        };
      };

      cmd_duration = {
        format = "[ $duration  ]($style)";
        style = "fg:text bg:surface0";
      };


      git_branch = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol $branch ](fg:base bg:green)]($style)";
      };

      git_status = {
        style = "bg:teal";
        format = "[[( $all_status$ahead_behind )](fg:base bg:green)]($style)";
      };

      git_metrics = {
        added_style = "bold blue bg:green";
        deleted_style = "bold red bg:green";
        format = "[+$added]($added_style)[/](fg:base bg:green)[-$deleted]($deleted_style)[ ](bg:green)";
        disabled = false;
      };

      docker_context = {
        symbol = "";
        style = "bg:blue";
        format = "[ $symbol $context]($style)";
      };

      aws = {
        style = "bg:blue";
        symbol = " ";
        format = "[ [$symbol](fg:peach bg:blue)($profile )(\\($region\\) )(\\[$duration\\] )]($style)";
      };

      # Programming Languages
      c = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };


      elixir = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      elm = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };


      golang = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol](fg:blue bg:teal)( [$version](fg:base bg:teal)) ]($style)";
      };

      gradle = {
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      java = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      julia = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      nim = {
        symbol = "󰆥";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      ruby = {
        symbol = "💎";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      scala = {
        symbol = "";
        style = "bg:teal";
        format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%T";  # Hour:Minute:Second Format
        style = "bg:surface0 fg:text";
        format = "[  $time ]($style)";
      };

      line_break = {
        disabled = false;
      };

      palette = "catppuccin_mocha";
      palettes = {
        catppuccin_mocha ={
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          orange = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };

      character = {
        disabled = false;
        success_symbol = "[✔ ](bold fg:green bg:surface0)";
        error_symbol = "[✔ ](bold fg:red bg:surface0)";
        format = "$symbol";
      };
    };
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rengers/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath= [
    "/usr/sbin:/usr/bin:/sbin:/bin"
      "/usr/local/sbin"
      "/usr/local/bin"
      "/opt/homebrew/sbin"
      "/opt/homebrew/bin"
      "$HOME/scripts"
      "$HOME/_scripts"
      "$HOME/.rbenv/bin"
      "$HOME/bin"
      "$HOME/.pyenv"
      "$PYENV_ROOT/bin"
      "/Library/Frameworks/GStreamer.framework/Versions/Current/bin"
      "$HOME/.toolbox/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
