DEVICE=$(networksetup -listallhardwareports | grep -A 2 -E "AirPort|Wi-Fi" | grep -m 1 -o -e en[0-9]);
case "{query}" in
    "on")
        networksetup -setairportpower $DEVICE On
        echo "Wi-Fi enabled."
    ;;
    "off")
        networksetup -setairportpower $DEVICE Off
        echo "Wi-Fi disabled.";
    ;;
esac