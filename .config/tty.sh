if [ "$TERM" = "linux" ]; then
    setfont -h16 /usr/share/kbd/consolefonts/eurlatgr.psfu.gz # easier to maintain than /etc/vconsole.conf
    echo -en "\e]PB282828" # S_base00
    echo -en "\e]PA98971a" # S_base01
    echo -en "\e]P032302f" # S_base02
    echo -en "\e]P6689d6a" # S_cyan
    echo -en "\e]P8d79921" # S_base03
    echo -en "\e]P298971a" # S_green
    echo -en "\e]P5d3869b" # S_magenta
    echo -en "\e]P1cc241d" # S_red
    echo -en "\e]PCebdbb2" # S_base0
    echo -en "\e]PE689d6a" # S_base1
    echo -en "\e]P9d79921" # S_orange
    echo -en "\e]P7ebdbb2" # S_base2 => modified to get a creme tone
    echo -en "\e]P4458588" # S_blue
    echo -en "\e]P3d79921" # S_yellow
    echo -en "\e]PFa89984" # S_base3
    echo -en "\e]PDb16286" # S_violet
    clear # against bg artifacts
    echo "$(</etc/motd)"
  fi
