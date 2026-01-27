# INOFFICE1

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| INOFFICE1 | l2leaf | INOFFICE1_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l3spine | INOFFICE1_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l3spine | INOFFICE1_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_SUBLEAF01C | - | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_SUBLEAF01D | - | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_SUBLEAF02C | - | cEOSLab | Not Available | - |
| INOFFICE1 | l2leaf | INOFFICE1_SUBLEAF02D | - | cEOSLab | Not Available | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | --------- | -------------- |
| l2leaf | INOFFICE1_LEAF01A | Ethernet49 | mlag_peer | INOFFICE1_LEAF01B | Ethernet49 |
| l2leaf | INOFFICE1_LEAF01A | Ethernet50 | mlag_peer | INOFFICE1_LEAF01B | Ethernet50 |
| l2leaf | INOFFICE1_LEAF01A | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet1 |
| l2leaf | INOFFICE1_LEAF01A | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet1 |
| l2leaf | INOFFICE1_LEAF01B | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet2 |
| l2leaf | INOFFICE1_LEAF01B | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet2 |
| l2leaf | INOFFICE1_LEAF02A | Ethernet49 | mlag_peer | INOFFICE1_LEAF02B | Ethernet49 |
| l2leaf | INOFFICE1_LEAF02A | Ethernet50 | mlag_peer | INOFFICE1_LEAF02B | Ethernet50 |
| l2leaf | INOFFICE1_LEAF02A | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet3 |
| l2leaf | INOFFICE1_LEAF02A | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet3 |
| l2leaf | INOFFICE1_LEAF02B | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet4 |
| l2leaf | INOFFICE1_LEAF02B | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet4 |
| l3spine | INOFFICE1_SPINE01 | Ethernet49 | mlag_peer | INOFFICE1_SPINE02 | Ethernet49 |
| l3spine | INOFFICE1_SPINE01 | Ethernet50 | mlag_peer | INOFFICE1_SPINE02 | Ethernet50 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 172.16.1.0/24 | 256 | 2 | 0.79 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| INOFFICE1 | INOFFICE1_SPINE01 | 172.16.1.1/32 |
| INOFFICE1 | INOFFICE1_SPINE02 | 172.16.1.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------------ | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
