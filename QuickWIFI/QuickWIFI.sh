DEVICE=$(networksetup -listnetworkserviceorder | awk '/Hardware Port: Wi-Fi/ { print $5 }');
case "{query}" in
    "on")
        networksetup -setairportpower ${DEVICE%)*} On
        echo "Wi-Fi enabled."
    ;;
    "off")
        networksetup -setairportpower ${DEVICE%)*} Off
        echo "Wi-Fi disabled."
    ;;
esac