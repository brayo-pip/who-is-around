nmcli radio wifi on

printf "$(date)\n$(nmcli -t -f SSID,BSSID -e no dev wifi)\n\n" >>~/wifi.log
