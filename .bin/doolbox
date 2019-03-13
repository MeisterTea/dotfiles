# !/bin/bash

# docker ps

function select_option {

  # Grabbed from stackoverflow
  # little helpers for terminal print control and key input
  ESC=$( printf "\033")
  cursor_blink_on()  { printf "$ESC[?25h"; }
  cursor_blink_off() { printf "$ESC[?25l"; }
  cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
  print_option()     { printf "   $1 "; }
  print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
  get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
  key_input()        { read -s -n3 key 2>/dev/null >&2
    if [[ $key = $ESC[A ]]; then echo up;    fi
    if [[ $key = $ESC[B ]]; then echo down;  fi
    if [[ $key = ""     ]]; then echo enter; fi; }

      # initially print empty new lines (scroll down if at bottom of screen)
      for opt; do printf "\n"; done

      # determine current screen position for overwriting the options
      local lastrow=`get_cursor_row`
      local startrow=$(($lastrow - $#))

      # ensure cursor and input echoing back on upon a ctrl+c during read -s
      trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
      cursor_blink_off

      local selected=0
      while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
          cursor_to $(($startrow + $idx))
          if [ $idx -eq $selected ]; then
            print_selected "$opt"
          else
            print_option "$opt"
          fi
          ((idx++))
        done

        # user key control
        case `key_input` in
          enter) break;;
          up)    ((selected--));
            if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
              if [ $selected -ge $# ]; then selected=0; fi;;
            esac
          done

          # cursor position back to normal
          cursor_to $lastrow
          printf "\n"
          cursor_blink_on

          return $selected
        }

        if [ $# -eq 0 ]
        then
          IFS=$'\n' containers=($(docker ps --format '{{.ID}} {{.Image}} {{.Names}}'))
          IFS=$' \t\n'
          echo "Selectionnez le conteneur concerné"
          select_option "${containers[@]}"
          choice=$?
          container=${containers[$choice]}
          containerArr=(${containers[$choice]})
          containerId=${containerArr[0]}
        else
          containerId=$1
          container=$(docker ps -f "id=$containerId" --format '{{.ID}} {{.Image}} {{.Names}}')
          if [ -z "$container" ]
          then
            echo "Aucun conteneur correspondant"
            exit
          fi
        fi
        clear
        echo "$container"
        options=("Logs depuis 30 minutes" "Tous les logs" "Bash" "Quitter")

        select_option "${options[@]}"
        choice=$?
        clear
        case $choice in
          0) docker logs $containerId --since '30m' -f;;
          1) docker logs $containerId -f;;
          2) docker exec -it $containerId /bin/bash;;
        esac
