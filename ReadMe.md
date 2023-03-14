# e-scan

The purpose of this script is to make easier the scanning process through the tool of [nmap](https://nmap.org/).
The script was created after the completion of the course by HackerSploit --> [Course](https://www.udemy.com/course/nmap-for-penetration-testing/)
It's a basic script for beginners, nothing special.

## Disclaimer

**The following script is intended for educational purposes only**. The creator of this script, do not condone or support any illegal or illicit activities that may result from its use. The script is meant to be used as a learning tool and any misuse of it is solely the responsibility of the user. We will not be held liable for any damages or legal issues that may arise from the use of this script in any unauthorized or illegal activities. By using this script, you agree to assume all responsibility and liability for its use and to use it in accordance with all applicable laws and regulations.

## Requirements

- Linux OS
- Sudo Privilege
- Nmap installed

## Installation

````bash
git clone https://github.com/ic3man31/e-scan.git &&
cd e-scan &&
chmod +x e-scan.sh && ./e-scan.sh
````

## HowTo

The main menù has 3 options:

1. `1) Host Discovery` - Host Discovery/Network Scanning is the process of identifying active hosts on a target network with the goal of creating a detailed schematic of the network infrastructure. In Host Discovery there 5 type of scanning:
	1. Ping Sweep
	2. Don't Ping
	3. Arp Ping
	4. Ninja Mode
2. `2) Scan Specific Host` - Port scanning is a method attackers use to scope out their target environment by sending packets to specific ports on a host and using the responses to find vulnerabilities and understand which services, and service versions, are running on a host. In this option there are 6 type of scanning available:
	1. OS Detection
	2. Scan All Ports
	3. Scan Specific Port
	4. Fast Scan
	5. Ninja Scan
	6. Aggressive Scan

To perform various scans, both for **Host Discovery** and **Scan Specific Host** options, **root privilege is required**; by inserting the word "sudo" before each scanning command.

### Ninja Mode

Both scanning options provide the Ninja Mode feature. This option allows scans to be performed by masking the IP and MAC addresses, where random IP and MAC addresses can be entered in both fields to make them valid. However, this mode's IP and MAC address masking functionality only works if the source IP is on the same network and interface as the target; otherwise, the scan will not yield the desired results. If you want to mask the IP by initiating the scan from another network, such as an external one or simply another LAN, you must use other nmap flags, such as fragmenting the packets sent and delaying scans, to avoid arousing suspicion from firewalls, IDS, IPS, etc. about a malicious or unusual scan.


## Authors

[J.Rosales](https://github.com/ic3man31/ic3man31)

## License

[LICENSE](License)
