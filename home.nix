{ pkgs, ... }:

{
  home.packages = [
    pkgs.htop
    pkgs.niv
    pkgs.nixpkgs-fmt
    pkgs._1password
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.git = {
    enable = true;
    userName = "Kodie Goodwin";
    userEmail = "kodiegoodwin@gmail.com";
  };

  programs.vim = {
    enable = true;
    # Add extraOptions setting
  };

  programs.vscode = {
    enable = true;
    # Add user settings
  };

  programs.ssh = {
    enable = true;
    controlMaster = "auto";
    controlPersist = "30m";
    forwardAgent = true;
  };

  ### Terminal 
  programs.alacritty = {
    enable = true;
    settings = {
      env = { TERM = "alacritty"; };
      window = { dynamic_padding = true; };
      draw_bold_text_with_bright_colors = true;
      background_opacity = .95;
      selection = {
        save_to_clipboard = true;
      };
      working_directory = "/home/enkoder";
      font = {
        normal = {
          family = "SF Mono Powerline";
          size = "12.0";
        };
      };
      colors = {
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };
        normal = {
          black = "#282c34";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };
        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#ffffff";
        };
      };
    };
  };


  ### sway
  wayland.windowManager.sway = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    settings = [{
      "layer" = "bottom";
      "position" = "top";
      "modules-left" = [ "sway/workspaces" ];
      "modules-center" = [ "clock" ];
      "modules-right" = [ "battery" "pulseaudio" ];
      "modules" = {
        "clock" = {
          "format" = "{:%b %d - %I:%M %p}";
          "tooltip" = false;
        };
        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "bat" = "BAT1";
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          "format-icons" = [ "" "" "" "" "" ];
        };
        "sway/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = false;
          "format" = "{name}: {icon}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "8" = "";
            "9" = "";
            "10" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };
        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" ];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
        };
      };
    }];
    style = ''
      * {
        color: rgba(236, 239, 244, 255);
        background: none;
        font-family: "Source Code Pro";
      }
    
      #battery {
        font-size: 16px;
        padding: 5px 8px 0px 8px;
        margin: 5px 0 0 0;
      }
    
      #clock {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        font-size: 16px;
        padding: 5px 8px 0px 8px;
        margin: 5px 10px 0 0;
      }
    
      #pulseaudio {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        font-size: 16px;
        padding: 5px 8px 0px 8px;
        margin: 5px 10px 0 0;
      }
    
      #workspaces {
        margin-left: 10px;
      }
    
      #workspaces button {
        padding: 1px 5px 0px 5px;
        margin: 5px 0 0 0;
        background-color: transparent;
        color: #ffffff;
        border-bottom: 3px solid transparent;
      }
    
      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
          box-shadow: inherit;
      }
    
      #workspaces button.focused {
          background-color: #282c34;
      }
    
      #workspaces button.urgent {
          background-color: #c678dd;
      }
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    prezto = {
      enable = true;
      editor.keymap = "vi";
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "history-substring-search"
        "prompt"
      ];
    };

  };


  programs.home-manager = {
    enable = true;
    path = "/home/enkoder";
  };

}
