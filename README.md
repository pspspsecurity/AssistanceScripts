# AssistanceScripts
Automation scripts for popular toolsets

## nmap.sh
How I find myself scanning most hosts. An initial scan discovers tcp port status, the open tcp ports are passed to a second scan to apply default scripts and collect service/version information. Outputs realtime.<br>
The script organizes scans with folders created by host address, scan output files have timestamps appended.

```
├── nmap-10.10.80.183
│   ├── basictcp-20-24.gnmap
│   ├── basictcp-20-24.nmap
│   ├── basictcp-20-24.xml
│   ├── basictcp-20-26.gnmap
│   ├── basictcp-20-26.nmap
│   ├── basictcp-20-26.xml
│   ├── tcpscripts-20-24.gnmap
│   ├── tcpscripts-20-24.nmap
│   ├── tcpscripts-20-24.xml
│   ├── tcpscripts-20-26.gnmap
│   ├── tcpscripts-20-26.nmap
│   └── tcpscripts-20-26.xml
├── nmap-10.10.80.22
│   ├── basictcp-20-31.gnmap
│   ├── basictcp-20-31.nmap
│   ├── basictcp-20-31.xml
│   ├── tcpscripts-20-31.gnmap
│   ├── tcpscripts-20-31.nmap
│   └── tcpscripts-20-31.xml
├── nmap.sh
```
