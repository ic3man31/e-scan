# Project Name: e-scan
# Version: 1.0
# Date: 24/05/2021
# Purpose: To make easier the scanning process through the tool nmap
# Disclaimer: Use this script only for Educational Purposes
# Feedbacks are welcome
#!/bin/bash


# New Line 
new_line(){
    echo
}

## Ninja MODE ##
ninj_mod(){
    new_line;
    echo "| Ninja Mode: ON |" &&
    new_line;
    echo -e "Type Decoy IP: \c"
    read decoy_ip &&
    new_line;
    echo -e "Type network interface [ex: eth0]: \c"
    read decoy_net &&
    new_line;
    echo -e "Type a specific MAC or a name of vendor [ex: Apple]: \c"
    read decoy_mac &&
    new_line;
}

# Clear 
clfunc(){
    new_line;
    echo -e "Do you want to clear your terminal and back to the Main Menu?[Y/n]: \c"
    read clear_rsp
        if [[ -z "$clear_rsp" || "$clear"_rsp == "y" ]]; then
            new_line; clear && main_slct;
        elif [[ "$clear_rsp" == "n" ]]; then
            exit
        fi
}

# Exit 
ex_func(){
    new_line;
    echo "[+] Thank you. Bye !" && exit
}

## Host Discovery Session

# Specify Network Subnet (Target) 
net_sub(){
    new_line; echo -e "Specify a range of IP  or a specific network subnet: \c"
    read target_sub;
}

# Ping Sweep 
hpsweep(){
    new_line;
    echo "[+] Flag used for this scan: -sn; --host-timeout 20s ..." && sleep 2;
    new_line;
    sudo nmap -sn $target_sub --host-timeout 20s
    new_line;
}

# Don't Ping
hnoping(){
    new_line;
    echo "[+] Flag used for this scan: -Pn; --host-timeout 20s ..." && sleep 2;
    new_line;
    sudo nmap -Pn $target_sub --host-timeout 20s
    new_line;
}

# Arp Ping
h_arp(){
    new_line;
    echo "[+] Flag used for this scan: -PR; --host-timeout 20s ..." && sleep 2;
    new_line;
    sudo nmap -PR $target_sub --host-timeout 20s
    new_line;
 }

# Ninja Host Discovery
ninj_hostdisco(){
    new_line;
    ninj_mod &&
    new_line &&
    sudo nmap -Pn -S $decoy_ip -e $decoy_net --spoof-mac $decoy_mac $target_sub 
    new_line;
}

# Host Discovery Menu
menu_hostdiscovery(){
    clear;
    new_line; bnr && new_line && echo -e "| \033[1;32mHost Discovery Mode\033[m"; 
    PS3="Select an option:"
    new_line;
    hostdiscoption=("Ping Sweep" "Don't Ping" "Arp Ping" "Ninja Mode" "Host Discovery Menu" "Main Menu" "Exit")
    select hdmenu in "${hostdiscoption[@]}"
    do
        case $hdmenu in
         "Ping Sweep")
            net_sub && hpsweep && clfunc;
            ;;
         "Don't Ping")
            net_sub && hnoping && clfunc; 
            ;;
         "Arp Ping")
            net_sub && h_arp && clfunc;
            ;;
         "Ninja Mode")
            net_sub && ninj_hostdisco && clfunc;
            ;;
         "Host Discovery Menu")
            menu_hostdiscovery 
            ;;
         "Main Menu")
            main_slct; 
            ;;   
         "Exit")
            ex_func; 
        ;;
        esac
    done
}

## Specific Host Session

# Specify IP target
spec_ip(){
    new_line;
    echo -e "Type IP Target: \c"
    read ip_target
}

# OS Detection
os_detect(){
    new_line;
    echo "[+] OS Detection ..."
    new_line &&
    sudo nmap -Pn -sS -O $ip_target
    new_line;
}

# All Port
scan_allports(){
    new_line;
    echo "[+] Scanning ALL the 65535 ports ... Be patient"
    new_line &&
    sudo nmap -Pn -sS -p- $ip_target
    new_line;
}
#
# Specific Port
spec_port(){
    new_line;
    echo -e "Type a specific port you want to scan: \c"
    read port_spec &&
    new_line &&
    sudo nmap -Pn -sS -p $port_spec $ip_target
    new_line;
}

# Fast Scan
scan_fast(){
    new_line;
    echo -e "[+] Scanning the top 100 common ports ..."
    new_line &&
    sudo nmap -Pn -sS -F $ip_target
    new_line;
}

# Ninja Specific Scan
ninja_shost(){
    new_line;
    ninj_mod &&
    new_line;
    sudo nmap -sS -Pn -S $decoy_ip -e $decoy_net --spoof-mac $decoy_mac $ip_target
    new_line;
}
#
# Aggressive Scan 
aggre_scan(){
   new_line;
   echo -e "[?] Attention: This scan is very noisy ! Do you want to continue?[Y/n]: \c"
   read answer
       if [[ -z "$answer" || "$answer" == "y" ]]; then
           new_line;
           echo -e "[+] Performing Aggressive scan ... "
           new_line;
           sudo nmap -A $ip_target
       elif [[ "$answer" == "n" ]]; then
           clear && hs_menu  
       fi
}

# Hs Menu
hs_menu(){
clear;
new_line; bnr && new_line && echo -e "| \033[1;32mScan Specific Host Mode\033[m"; 
PS3="Select an option:"
new_line
hs_option=("OS Detection" "Scan All Ports" "Scan Specific Port" "Fast Scan" "Ninja Mode" "Aggressive Scan" "HS Menu" "Main Menu" "Exit") 
new_line
select hsopt in "${hs_option[@]}"
    do
        case $hsopt in 
            "OS Detection" )
                spec_ip && os_detect && clfunc
                ;;
            "Scan All Ports" )
                spec_ip && scan_allports && clfunc
                ;;
            "Scan Specific Port" )
                spec_ip && spec_port && clfunc
                ;;
            "Fast Scan" )
                spec_ip && scan_fast && clfunc
                ;;
            "Ninja Mode" )
                spec_ip && ninja_shost && clfunc
                ;;
            "Aggressive Scan" )
                spec_ip && aggre_scan && clfunc 
                ;;
            "HS Menu" )
                hs_menu
                ;;
            "Main Menu" )
                main_slct
                ;;
            "Exit" )
                ex_func
                ;;
        esac
    done
}

banner(){
    new_line;
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  echo -e "|               \033[5;31mE-SCAN\033[m   "
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}

bnr() {
    banner "Written by: J.Rosales"
}

main_slct(){
    new_line; clear;
    bnr &&
    new_line;
    PS3="Select an option: "
    new_line
    m_menu=("Host Discovery" "Scan Specific Host" "Exit")
    new_line
    select menu in "${m_menu[@]}"
        do
            case $menu in
                "Host Discovery" )
                    menu_hostdiscovery
                    ;;
                "Scan Specific Host" )
                    hs_menu
                    ;;
                "Exit" )
                    ex_func
                    ;;
            esac
        done
}

main_slct   
