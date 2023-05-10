# e-scan

## Description

e-scan is a script that simplifies the scanning process using the tool nmap. It provides an interactive menu to perform various scanning tasks, including host discovery and specific host scanning.
The script was created after the completion of the course by HackerSploit --> [Course](https://www.udemy.com/course/nmap-for-penetration-testing/)

## Disclaimer

**The following script is intended for educational purposes only**. The creator of this script, do not condone or support any illegal or illicit activities that may result from its use. The script is meant to be used as a learning tool and any misuse of it is solely the responsibility of the user. We will not be held liable for any damages or legal issues that may arise from the use of this script in any unauthorized or illegal activities. By using this script, you agree to assume all responsibility and liability for its use and to use it in accordance with all applicable laws and regulations.

## Requirements

-   The script requires nmap to be installed on the system.
-   The script should be run with root or sudo privileges.

## Usage

1.  Clone the repository or download the script file.
2.  Open a terminal and navigate to the directory where the script is located.
3.  Run the script using the following command:

````bash
./e-scan.sh
````

4. Follow the on-screen instructions to select the desired scanning options from the menu.


## Features

### Host Discovery Mode

-   Ping Sweep: Performs a ping sweep scan (-sn) on a specified range of IP addresses or network subnet.
-   Don't Ping: Scans the specified range of IP addresses or network subnet without sending ICMP ping probes (-Pn).
-   Arp Ping: Sends ARP requests to discover hosts on the network (-PR).
-   Ninja Mode: Allows advanced configuration options for host discovery, including decoy IP, network interface, and MAC address spoofing.

### Scan Specific Host Mode

-   OS Detection: Performs OS detection (-O) on a specific IP target.
-   Scan All Ports: Scans all 65535 ports on a specific IP target.
-   Scan Specific Port: Scans a specific port on a specific IP target.
-   Fast Scan: Scans the top 100 common ports on a specific IP target.
-   Ninja Mode: Allows advanced configuration options for specific host scanning, similar to Ninja Mode in Host Discovery.
-   Aggressive Scan: Performs an aggressive scan (-A) on a specific IP target. Note: This scan can be very noisy.

## Feedback

Feedback and suggestions for improvement are welcome. Feel free to create an issue in the GitHub repository or contact the author directly.

## License

This script is released under the [MIT License](https://opensource.org/licenses/MIT).
