if [ "$TERM" = "linux" ]; then
    echo -en "\e]PB282828" # S_base00
    echo -en "\e]PA98971a" # S_base01
    echo -en "\e]P032302f" # S_base02
    echo -en "\e]P6689d6a" # S_cyan
    echo -en "\e]P8d79921" # S_base03
    echo -en "\e]P2b8bb26" # S_green
    echo -en "\e]P5d3869b" # S_magenta
    echo -en "\e]P1fb4934" # S_red
    echo -en "\e]PCebdbb2" # S_base0
    echo -en "\e]PE689d6a" # S_base1
    echo -en "\e]P9d79921" # S_orange
    echo -en "\e]P798971a" # S_base2
    echo -en "\e]P483a598" # S_blue
    echo -en "\e]P3fabd2f" # S_yellow
    echo -en "\e]PFd79921" # S_base3
    echo -en "\e]PD689d6a" # S_violet
    clear # against bg artifacts
  fi

