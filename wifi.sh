nmcli -t device status |grep "wifi:unavailable:"
wifi_was_off=$?

if (($wifi_was_off))
then
    nmcli radio wifi on
    nmcli -w 1 device wifi rescan
fi

printf "$(date)\n$(nmcli -t -f SSID,BSSID,BARS -e no dev wifi)\n\n" >>~/wifi.log

if ((!$wifi_was_off)) # Return the wifi to it's prior state
then 
    nmcli -w 5 radio wifi off
fi