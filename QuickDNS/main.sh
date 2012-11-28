
DEVICE=$(networksetup -listnetworkserviceorder | awk '
    BEGIN {
        "netstat -rn | grep default " | getline var
        split(var, ARRAY, " ")
    }

    { if ($5 ~ ARRAY[6]) { NAME=$3 } }

    END { print NAME }
')

dscacheutil -flushcache
case "{query}" in
    "114")
        networksetup -setdnsservers ${DEVICE%,*} 114.114.114.114 114.114.115.115
        echo "Using 114 Public DNS on your ${DEVICE%,*} connection."                                                                                                                 
    ;;
    "v2ex")
        networksetup -setdnsservers ${DEVICE%,*} 199.91.73.222 178.79.131.110
        echo "Using V2EX Public DNS on your ${DEVICE%,*} connection."                                                                                                                 
    ;;
    "google")
        networksetup -setdnsservers ${DEVICE%,*} 8.8.8.8 8.8.4.4
        echo "Using Google Public DNS on your ${DEVICE%,*} connection."
    ;;
    "opendns")
        networksetup -setdnsservers ${DEVICE%,*} 208.67.222.222 208.67.220.220
        echo "Using OpenDNS on your ${DEVICE%,*} connection."
    ;;
    "default")
        networksetup -setdnsservers ${DEVICE%,*} empty
        echo "Using Default DNS on your ${DEVICE%,*} connection."
    ;;
    "status")
        echo $(networksetup -getdnsservers ${DEVICE%,*})
    ;;
esac
