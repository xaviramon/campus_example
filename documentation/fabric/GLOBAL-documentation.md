# GLOBAL

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
| INOFFICE1 | internet_leaves | INOFFICE1_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| INOFFICE1 | internet_leaves | INOFFICE1_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| INOFFICE1 | distribution_leaf | INOFFICE1_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| INOFFICE1 | distribution_leaf | INOFFICE1_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| INOFFICE1 | distribution_leaf | INOFFICE1_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| INOFFICE1 | distribution_leaf | INOFFICE1_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l3spine | INOFFICE1_SPINE01 | 172.16.100.99/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l3spine | INOFFICE1_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2subleaf | INOFFICE1_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2subleaf | INOFFICE1_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2subleaf | INOFFICE1_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| INOFFICE1 | l2subleaf | INOFFICE1_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |
| INOFFICE2 | internet_leaves | INOFFICE2_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| INOFFICE2 | internet_leaves | INOFFICE2_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| INOFFICE2 | distribution_leaf | INOFFICE2_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| INOFFICE2 | distribution_leaf | INOFFICE2_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| INOFFICE2 | distribution_leaf | INOFFICE2_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| INOFFICE2 | distribution_leaf | INOFFICE2_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| INOFFICE2 | l3spine | INOFFICE2_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| INOFFICE2 | l3spine | INOFFICE2_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| INOFFICE2 | l2subleaf | INOFFICE2_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| INOFFICE2 | l2subleaf | INOFFICE2_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| INOFFICE2 | l2subleaf | INOFFICE2_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| INOFFICE2 | l2subleaf | INOFFICE2_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | internet_leaves | UKOFFICE1_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | internet_leaves | UKOFFICE1_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | distribution_leaf | UKOFFICE1_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | distribution_leaf | UKOFFICE1_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | distribution_leaf | UKOFFICE1_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | distribution_leaf | UKOFFICE1_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | l3spine | UKOFFICE1_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | l3spine | UKOFFICE1_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | l2subleaf | UKOFFICE1_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | l2subleaf | UKOFFICE1_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | l2subleaf | UKOFFICE1_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| UKOFFICE1 | l2subleaf | UKOFFICE1_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | internet_leaves | UKOFFICE2_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | internet_leaves | UKOFFICE2_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | distribution_leaf | UKOFFICE2_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | distribution_leaf | UKOFFICE2_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | distribution_leaf | UKOFFICE2_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | distribution_leaf | UKOFFICE2_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | l3spine | UKOFFICE2_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | l3spine | UKOFFICE2_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | l2subleaf | UKOFFICE2_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | l2subleaf | UKOFFICE2_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | l2subleaf | UKOFFICE2_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| UKOFFICE2 | l2subleaf | UKOFFICE2_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |
| USOFFICE1 | internet_leaves | USOFFICE1_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| USOFFICE1 | internet_leaves | USOFFICE1_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| USOFFICE1 | distribution_leaf | USOFFICE1_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| USOFFICE1 | distribution_leaf | USOFFICE1_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| USOFFICE1 | distribution_leaf | USOFFICE1_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| USOFFICE1 | distribution_leaf | USOFFICE1_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| USOFFICE1 | l3spine | USOFFICE1_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| USOFFICE1 | l3spine | USOFFICE1_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| USOFFICE1 | l2subleaf | USOFFICE1_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| USOFFICE1 | l2subleaf | USOFFICE1_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| USOFFICE1 | l2subleaf | USOFFICE1_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| USOFFICE1 | l2subleaf | USOFFICE1_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |
| USOFFICE2 | internet_leaves | USOFFICE2_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| USOFFICE2 | internet_leaves | USOFFICE2_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| USOFFICE2 | distribution_leaf | USOFFICE2_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| USOFFICE2 | distribution_leaf | USOFFICE2_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| USOFFICE2 | distribution_leaf | USOFFICE2_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| USOFFICE2 | distribution_leaf | USOFFICE2_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| USOFFICE2 | l3spine | USOFFICE2_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| USOFFICE2 | l3spine | USOFFICE2_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| USOFFICE2 | l2subleaf | USOFFICE2_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| USOFFICE2 | l2subleaf | USOFFICE2_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| USOFFICE2 | l2subleaf | USOFFICE2_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| USOFFICE2 | l2subleaf | USOFFICE2_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |
| USOFFICE3 | internet_leaves | USOFFICE3_INTERNET_LEAF01 | 172.16.100.120/24 | cEOSLab | Not Available | - |
| USOFFICE3 | internet_leaves | USOFFICE3_INTERNET_LEAF02 | 172.16.100.121/24 | cEOSLab | Not Available | - |
| USOFFICE3 | distribution_leaf | USOFFICE3_LEAF01A | 172.16.100.103/24 | cEOSLab | Not Available | - |
| USOFFICE3 | distribution_leaf | USOFFICE3_LEAF01B | 172.16.100.104/24 | cEOSLab | Not Available | - |
| USOFFICE3 | distribution_leaf | USOFFICE3_LEAF02A | 172.16.100.105/24 | cEOSLab | Not Available | - |
| USOFFICE3 | distribution_leaf | USOFFICE3_LEAF02B | 172.16.100.106/24 | cEOSLab | Not Available | - |
| USOFFICE3 | l3spine | USOFFICE3_SPINE01 | 172.16.100.101/24 | cEOSLab | Not Available | - |
| USOFFICE3 | l3spine | USOFFICE3_SPINE02 | 172.16.100.102/24 | cEOSLab | Not Available | - |
| USOFFICE3 | l2subleaf | USOFFICE3_SUBLEAF01C | 172.16.100.108/24 | cEOSLab | Not Available | - |
| USOFFICE3 | l2subleaf | USOFFICE3_SUBLEAF01D | 172.16.100.109/24 | cEOSLab | Not Available | - |
| USOFFICE3 | l2subleaf | USOFFICE3_SUBLEAF02C | 172.16.100.110/24 | cEOSLab | Not Available | - |
| USOFFICE3 | l2subleaf | USOFFICE3_SUBLEAF02D | 172.16.100.111/24 | cEOSLab | Not Available | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | --------- | -------------- |
| internet_leaves | INOFFICE1_INTERNET_LEAF01 | Ethernet49 | l3spine | INOFFICE1_SPINE01 | Ethernet47 |
| internet_leaves | INOFFICE1_INTERNET_LEAF01 | Ethernet50 | l3spine | INOFFICE1_SPINE02 | Ethernet47 |
| internet_leaves | INOFFICE1_INTERNET_LEAF02 | Ethernet49 | l3spine | INOFFICE1_SPINE01 | Ethernet48 |
| internet_leaves | INOFFICE1_INTERNET_LEAF02 | Ethernet50 | l3spine | INOFFICE1_SPINE02 | Ethernet48 |
| distribution_leaf | INOFFICE1_LEAF01A | Ethernet1 | l2subleaf | INOFFICE1_SUBLEAF01C | Ethernet49 |
| distribution_leaf | INOFFICE1_LEAF01A | Ethernet2 | l2subleaf | INOFFICE1_SUBLEAF01D | Ethernet49 |
| distribution_leaf | INOFFICE1_LEAF01A | Ethernet49 | mlag_peer | INOFFICE1_LEAF01B | Ethernet49 |
| distribution_leaf | INOFFICE1_LEAF01A | Ethernet50 | mlag_peer | INOFFICE1_LEAF01B | Ethernet50 |
| distribution_leaf | INOFFICE1_LEAF01A | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet1 |
| distribution_leaf | INOFFICE1_LEAF01A | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet1 |
| distribution_leaf | INOFFICE1_LEAF01B | Ethernet1 | l2subleaf | INOFFICE1_SUBLEAF01C | Ethernet50 |
| distribution_leaf | INOFFICE1_LEAF01B | Ethernet2 | l2subleaf | INOFFICE1_SUBLEAF01D | Ethernet50 |
| distribution_leaf | INOFFICE1_LEAF01B | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet2 |
| distribution_leaf | INOFFICE1_LEAF01B | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet2 |
| distribution_leaf | INOFFICE1_LEAF02A | Ethernet1 | l2subleaf | INOFFICE1_SUBLEAF02C | Ethernet49 |
| distribution_leaf | INOFFICE1_LEAF02A | Ethernet2 | l2subleaf | INOFFICE1_SUBLEAF02D | Ethernet49 |
| distribution_leaf | INOFFICE1_LEAF02A | Ethernet49 | mlag_peer | INOFFICE1_LEAF02B | Ethernet49 |
| distribution_leaf | INOFFICE1_LEAF02A | Ethernet50 | mlag_peer | INOFFICE1_LEAF02B | Ethernet50 |
| distribution_leaf | INOFFICE1_LEAF02A | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet3 |
| distribution_leaf | INOFFICE1_LEAF02A | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet3 |
| distribution_leaf | INOFFICE1_LEAF02B | Ethernet1 | l2subleaf | INOFFICE1_SUBLEAF02C | Ethernet50 |
| distribution_leaf | INOFFICE1_LEAF02B | Ethernet2 | l2subleaf | INOFFICE1_SUBLEAF02D | Ethernet50 |
| distribution_leaf | INOFFICE1_LEAF02B | Ethernet51 | l3spine | INOFFICE1_SPINE01 | Ethernet4 |
| distribution_leaf | INOFFICE1_LEAF02B | Ethernet52 | l3spine | INOFFICE1_SPINE02 | Ethernet4 |
| l3spine | INOFFICE1_SPINE01 | Ethernet49 | mlag_peer | INOFFICE1_SPINE02 | Ethernet49 |
| l3spine | INOFFICE1_SPINE01 | Ethernet50 | mlag_peer | INOFFICE1_SPINE02 | Ethernet50 |
| internet_leaves | INOFFICE2_INTERNET_LEAF01 | Ethernet49 | l3spine | INOFFICE2_SPINE01 | Ethernet47 |
| internet_leaves | INOFFICE2_INTERNET_LEAF01 | Ethernet50 | l3spine | INOFFICE2_SPINE02 | Ethernet47 |
| internet_leaves | INOFFICE2_INTERNET_LEAF02 | Ethernet49 | l3spine | INOFFICE2_SPINE01 | Ethernet48 |
| internet_leaves | INOFFICE2_INTERNET_LEAF02 | Ethernet50 | l3spine | INOFFICE2_SPINE02 | Ethernet48 |
| distribution_leaf | INOFFICE2_LEAF01A | Ethernet1 | l2subleaf | INOFFICE2_SUBLEAF01C | Ethernet49 |
| distribution_leaf | INOFFICE2_LEAF01A | Ethernet2 | l2subleaf | INOFFICE2_SUBLEAF01D | Ethernet49 |
| distribution_leaf | INOFFICE2_LEAF01A | Ethernet49 | mlag_peer | INOFFICE2_LEAF01B | Ethernet49 |
| distribution_leaf | INOFFICE2_LEAF01A | Ethernet50 | mlag_peer | INOFFICE2_LEAF01B | Ethernet50 |
| distribution_leaf | INOFFICE2_LEAF01A | Ethernet51 | l3spine | INOFFICE2_SPINE01 | Ethernet1 |
| distribution_leaf | INOFFICE2_LEAF01A | Ethernet52 | l3spine | INOFFICE2_SPINE02 | Ethernet1 |
| distribution_leaf | INOFFICE2_LEAF01B | Ethernet1 | l2subleaf | INOFFICE2_SUBLEAF01C | Ethernet50 |
| distribution_leaf | INOFFICE2_LEAF01B | Ethernet2 | l2subleaf | INOFFICE2_SUBLEAF01D | Ethernet50 |
| distribution_leaf | INOFFICE2_LEAF01B | Ethernet51 | l3spine | INOFFICE2_SPINE01 | Ethernet2 |
| distribution_leaf | INOFFICE2_LEAF01B | Ethernet52 | l3spine | INOFFICE2_SPINE02 | Ethernet2 |
| distribution_leaf | INOFFICE2_LEAF02A | Ethernet1 | l2subleaf | INOFFICE2_SUBLEAF02C | Ethernet49 |
| distribution_leaf | INOFFICE2_LEAF02A | Ethernet2 | l2subleaf | INOFFICE2_SUBLEAF02D | Ethernet49 |
| distribution_leaf | INOFFICE2_LEAF02A | Ethernet49 | mlag_peer | INOFFICE2_LEAF02B | Ethernet49 |
| distribution_leaf | INOFFICE2_LEAF02A | Ethernet50 | mlag_peer | INOFFICE2_LEAF02B | Ethernet50 |
| distribution_leaf | INOFFICE2_LEAF02A | Ethernet51 | l3spine | INOFFICE2_SPINE01 | Ethernet3 |
| distribution_leaf | INOFFICE2_LEAF02A | Ethernet52 | l3spine | INOFFICE2_SPINE02 | Ethernet3 |
| distribution_leaf | INOFFICE2_LEAF02B | Ethernet1 | l2subleaf | INOFFICE2_SUBLEAF02C | Ethernet50 |
| distribution_leaf | INOFFICE2_LEAF02B | Ethernet2 | l2subleaf | INOFFICE2_SUBLEAF02D | Ethernet50 |
| distribution_leaf | INOFFICE2_LEAF02B | Ethernet51 | l3spine | INOFFICE2_SPINE01 | Ethernet4 |
| distribution_leaf | INOFFICE2_LEAF02B | Ethernet52 | l3spine | INOFFICE2_SPINE02 | Ethernet4 |
| l3spine | INOFFICE2_SPINE01 | Ethernet49 | mlag_peer | INOFFICE2_SPINE02 | Ethernet49 |
| l3spine | INOFFICE2_SPINE01 | Ethernet50 | mlag_peer | INOFFICE2_SPINE02 | Ethernet50 |
| internet_leaves | UKOFFICE1_INTERNET_LEAF01 | Ethernet49 | l3spine | UKOFFICE1_SPINE01 | Ethernet47 |
| internet_leaves | UKOFFICE1_INTERNET_LEAF01 | Ethernet50 | l3spine | UKOFFICE1_SPINE02 | Ethernet47 |
| internet_leaves | UKOFFICE1_INTERNET_LEAF02 | Ethernet49 | l3spine | UKOFFICE1_SPINE01 | Ethernet48 |
| internet_leaves | UKOFFICE1_INTERNET_LEAF02 | Ethernet50 | l3spine | UKOFFICE1_SPINE02 | Ethernet48 |
| distribution_leaf | UKOFFICE1_LEAF01A | Ethernet1 | l2subleaf | UKOFFICE1_SUBLEAF01C | Ethernet49 |
| distribution_leaf | UKOFFICE1_LEAF01A | Ethernet2 | l2subleaf | UKOFFICE1_SUBLEAF01D | Ethernet49 |
| distribution_leaf | UKOFFICE1_LEAF01A | Ethernet49 | mlag_peer | UKOFFICE1_LEAF01B | Ethernet49 |
| distribution_leaf | UKOFFICE1_LEAF01A | Ethernet50 | mlag_peer | UKOFFICE1_LEAF01B | Ethernet50 |
| distribution_leaf | UKOFFICE1_LEAF01A | Ethernet51 | l3spine | UKOFFICE1_SPINE01 | Ethernet1 |
| distribution_leaf | UKOFFICE1_LEAF01A | Ethernet52 | l3spine | UKOFFICE1_SPINE02 | Ethernet1 |
| distribution_leaf | UKOFFICE1_LEAF01B | Ethernet1 | l2subleaf | UKOFFICE1_SUBLEAF01C | Ethernet50 |
| distribution_leaf | UKOFFICE1_LEAF01B | Ethernet2 | l2subleaf | UKOFFICE1_SUBLEAF01D | Ethernet50 |
| distribution_leaf | UKOFFICE1_LEAF01B | Ethernet51 | l3spine | UKOFFICE1_SPINE01 | Ethernet2 |
| distribution_leaf | UKOFFICE1_LEAF01B | Ethernet52 | l3spine | UKOFFICE1_SPINE02 | Ethernet2 |
| distribution_leaf | UKOFFICE1_LEAF02A | Ethernet1 | l2subleaf | UKOFFICE1_SUBLEAF02C | Ethernet49 |
| distribution_leaf | UKOFFICE1_LEAF02A | Ethernet2 | l2subleaf | UKOFFICE1_SUBLEAF02D | Ethernet49 |
| distribution_leaf | UKOFFICE1_LEAF02A | Ethernet49 | mlag_peer | UKOFFICE1_LEAF02B | Ethernet49 |
| distribution_leaf | UKOFFICE1_LEAF02A | Ethernet50 | mlag_peer | UKOFFICE1_LEAF02B | Ethernet50 |
| distribution_leaf | UKOFFICE1_LEAF02A | Ethernet51 | l3spine | UKOFFICE1_SPINE01 | Ethernet3 |
| distribution_leaf | UKOFFICE1_LEAF02A | Ethernet52 | l3spine | UKOFFICE1_SPINE02 | Ethernet3 |
| distribution_leaf | UKOFFICE1_LEAF02B | Ethernet1 | l2subleaf | UKOFFICE1_SUBLEAF02C | Ethernet50 |
| distribution_leaf | UKOFFICE1_LEAF02B | Ethernet2 | l2subleaf | UKOFFICE1_SUBLEAF02D | Ethernet50 |
| distribution_leaf | UKOFFICE1_LEAF02B | Ethernet51 | l3spine | UKOFFICE1_SPINE01 | Ethernet4 |
| distribution_leaf | UKOFFICE1_LEAF02B | Ethernet52 | l3spine | UKOFFICE1_SPINE02 | Ethernet4 |
| l3spine | UKOFFICE1_SPINE01 | Ethernet49 | mlag_peer | UKOFFICE1_SPINE02 | Ethernet49 |
| l3spine | UKOFFICE1_SPINE01 | Ethernet50 | mlag_peer | UKOFFICE1_SPINE02 | Ethernet50 |
| internet_leaves | UKOFFICE2_INTERNET_LEAF01 | Ethernet49 | l3spine | UKOFFICE2_SPINE01 | Ethernet47 |
| internet_leaves | UKOFFICE2_INTERNET_LEAF01 | Ethernet50 | l3spine | UKOFFICE2_SPINE02 | Ethernet47 |
| internet_leaves | UKOFFICE2_INTERNET_LEAF02 | Ethernet49 | l3spine | UKOFFICE2_SPINE01 | Ethernet48 |
| internet_leaves | UKOFFICE2_INTERNET_LEAF02 | Ethernet50 | l3spine | UKOFFICE2_SPINE02 | Ethernet48 |
| distribution_leaf | UKOFFICE2_LEAF01A | Ethernet1 | l2subleaf | UKOFFICE2_SUBLEAF01C | Ethernet49 |
| distribution_leaf | UKOFFICE2_LEAF01A | Ethernet2 | l2subleaf | UKOFFICE2_SUBLEAF01D | Ethernet49 |
| distribution_leaf | UKOFFICE2_LEAF01A | Ethernet49 | mlag_peer | UKOFFICE2_LEAF01B | Ethernet49 |
| distribution_leaf | UKOFFICE2_LEAF01A | Ethernet50 | mlag_peer | UKOFFICE2_LEAF01B | Ethernet50 |
| distribution_leaf | UKOFFICE2_LEAF01A | Ethernet51 | l3spine | UKOFFICE2_SPINE01 | Ethernet1 |
| distribution_leaf | UKOFFICE2_LEAF01A | Ethernet52 | l3spine | UKOFFICE2_SPINE02 | Ethernet1 |
| distribution_leaf | UKOFFICE2_LEAF01B | Ethernet1 | l2subleaf | UKOFFICE2_SUBLEAF01C | Ethernet50 |
| distribution_leaf | UKOFFICE2_LEAF01B | Ethernet2 | l2subleaf | UKOFFICE2_SUBLEAF01D | Ethernet50 |
| distribution_leaf | UKOFFICE2_LEAF01B | Ethernet51 | l3spine | UKOFFICE2_SPINE01 | Ethernet2 |
| distribution_leaf | UKOFFICE2_LEAF01B | Ethernet52 | l3spine | UKOFFICE2_SPINE02 | Ethernet2 |
| distribution_leaf | UKOFFICE2_LEAF02A | Ethernet1 | l2subleaf | UKOFFICE2_SUBLEAF02C | Ethernet49 |
| distribution_leaf | UKOFFICE2_LEAF02A | Ethernet2 | l2subleaf | UKOFFICE2_SUBLEAF02D | Ethernet49 |
| distribution_leaf | UKOFFICE2_LEAF02A | Ethernet49 | mlag_peer | UKOFFICE2_LEAF02B | Ethernet49 |
| distribution_leaf | UKOFFICE2_LEAF02A | Ethernet50 | mlag_peer | UKOFFICE2_LEAF02B | Ethernet50 |
| distribution_leaf | UKOFFICE2_LEAF02A | Ethernet51 | l3spine | UKOFFICE2_SPINE01 | Ethernet3 |
| distribution_leaf | UKOFFICE2_LEAF02A | Ethernet52 | l3spine | UKOFFICE2_SPINE02 | Ethernet3 |
| distribution_leaf | UKOFFICE2_LEAF02B | Ethernet1 | l2subleaf | UKOFFICE2_SUBLEAF02C | Ethernet50 |
| distribution_leaf | UKOFFICE2_LEAF02B | Ethernet2 | l2subleaf | UKOFFICE2_SUBLEAF02D | Ethernet50 |
| distribution_leaf | UKOFFICE2_LEAF02B | Ethernet51 | l3spine | UKOFFICE2_SPINE01 | Ethernet4 |
| distribution_leaf | UKOFFICE2_LEAF02B | Ethernet52 | l3spine | UKOFFICE2_SPINE02 | Ethernet4 |
| l3spine | UKOFFICE2_SPINE01 | Ethernet49 | mlag_peer | UKOFFICE2_SPINE02 | Ethernet49 |
| l3spine | UKOFFICE2_SPINE01 | Ethernet50 | mlag_peer | UKOFFICE2_SPINE02 | Ethernet50 |
| internet_leaves | USOFFICE1_INTERNET_LEAF01 | Ethernet49 | l3spine | USOFFICE1_SPINE01 | Ethernet47 |
| internet_leaves | USOFFICE1_INTERNET_LEAF01 | Ethernet50 | l3spine | USOFFICE1_SPINE02 | Ethernet47 |
| internet_leaves | USOFFICE1_INTERNET_LEAF02 | Ethernet49 | l3spine | USOFFICE1_SPINE01 | Ethernet48 |
| internet_leaves | USOFFICE1_INTERNET_LEAF02 | Ethernet50 | l3spine | USOFFICE1_SPINE02 | Ethernet48 |
| distribution_leaf | USOFFICE1_LEAF01A | Ethernet1 | l2subleaf | USOFFICE1_SUBLEAF01C | Ethernet49 |
| distribution_leaf | USOFFICE1_LEAF01A | Ethernet2 | l2subleaf | USOFFICE1_SUBLEAF01D | Ethernet49 |
| distribution_leaf | USOFFICE1_LEAF01A | Ethernet49 | mlag_peer | USOFFICE1_LEAF01B | Ethernet49 |
| distribution_leaf | USOFFICE1_LEAF01A | Ethernet50 | mlag_peer | USOFFICE1_LEAF01B | Ethernet50 |
| distribution_leaf | USOFFICE1_LEAF01A | Ethernet51 | l3spine | USOFFICE1_SPINE01 | Ethernet1 |
| distribution_leaf | USOFFICE1_LEAF01A | Ethernet52 | l3spine | USOFFICE1_SPINE02 | Ethernet1 |
| distribution_leaf | USOFFICE1_LEAF01B | Ethernet1 | l2subleaf | USOFFICE1_SUBLEAF01C | Ethernet51 |
| distribution_leaf | USOFFICE1_LEAF01B | Ethernet2 | l2subleaf | USOFFICE1_SUBLEAF01D | Ethernet51 |
| distribution_leaf | USOFFICE1_LEAF01B | Ethernet51 | l3spine | USOFFICE1_SPINE01 | Ethernet2 |
| distribution_leaf | USOFFICE1_LEAF01B | Ethernet52 | l3spine | USOFFICE1_SPINE02 | Ethernet2 |
| distribution_leaf | USOFFICE1_LEAF02A | Ethernet1 | l2subleaf | USOFFICE1_SUBLEAF02C | Ethernet49 |
| distribution_leaf | USOFFICE1_LEAF02A | Ethernet2 | l2subleaf | USOFFICE1_SUBLEAF02D | Ethernet49 |
| distribution_leaf | USOFFICE1_LEAF02A | Ethernet49 | mlag_peer | USOFFICE1_LEAF02B | Ethernet49 |
| distribution_leaf | USOFFICE1_LEAF02A | Ethernet50 | mlag_peer | USOFFICE1_LEAF02B | Ethernet50 |
| distribution_leaf | USOFFICE1_LEAF02A | Ethernet51 | l3spine | USOFFICE1_SPINE01 | Ethernet3 |
| distribution_leaf | USOFFICE1_LEAF02A | Ethernet52 | l3spine | USOFFICE1_SPINE02 | Ethernet3 |
| distribution_leaf | USOFFICE1_LEAF02B | Ethernet1 | l2subleaf | USOFFICE1_SUBLEAF02C | Ethernet51 |
| distribution_leaf | USOFFICE1_LEAF02B | Ethernet2 | l2subleaf | USOFFICE1_SUBLEAF02D | Ethernet51 |
| distribution_leaf | USOFFICE1_LEAF02B | Ethernet51 | l3spine | USOFFICE1_SPINE01 | Ethernet4 |
| distribution_leaf | USOFFICE1_LEAF02B | Ethernet52 | l3spine | USOFFICE1_SPINE02 | Ethernet4 |
| l3spine | USOFFICE1_SPINE01 | Ethernet49 | mlag_peer | USOFFICE1_SPINE02 | Ethernet49 |
| l3spine | USOFFICE1_SPINE01 | Ethernet50 | mlag_peer | USOFFICE1_SPINE02 | Ethernet50 |
| internet_leaves | USOFFICE2_INTERNET_LEAF01 | Ethernet49 | l3spine | USOFFICE2_SPINE01 | Ethernet47 |
| internet_leaves | USOFFICE2_INTERNET_LEAF01 | Ethernet50 | l3spine | USOFFICE2_SPINE02 | Ethernet47 |
| internet_leaves | USOFFICE2_INTERNET_LEAF02 | Ethernet49 | l3spine | USOFFICE2_SPINE01 | Ethernet48 |
| internet_leaves | USOFFICE2_INTERNET_LEAF02 | Ethernet50 | l3spine | USOFFICE2_SPINE02 | Ethernet48 |
| distribution_leaf | USOFFICE2_LEAF01A | Ethernet1 | l2subleaf | USOFFICE2_SUBLEAF01C | Ethernet49 |
| distribution_leaf | USOFFICE2_LEAF01A | Ethernet2 | l2subleaf | USOFFICE2_SUBLEAF01D | Ethernet49 |
| distribution_leaf | USOFFICE2_LEAF01A | Ethernet49 | mlag_peer | USOFFICE2_LEAF01B | Ethernet49 |
| distribution_leaf | USOFFICE2_LEAF01A | Ethernet50 | mlag_peer | USOFFICE2_LEAF01B | Ethernet50 |
| distribution_leaf | USOFFICE2_LEAF01A | Ethernet51 | l3spine | USOFFICE2_SPINE01 | Ethernet1 |
| distribution_leaf | USOFFICE2_LEAF01A | Ethernet52 | l3spine | USOFFICE2_SPINE02 | Ethernet1 |
| distribution_leaf | USOFFICE2_LEAF01B | Ethernet1 | l2subleaf | USOFFICE2_SUBLEAF01C | Ethernet50 |
| distribution_leaf | USOFFICE2_LEAF01B | Ethernet2 | l2subleaf | USOFFICE2_SUBLEAF01D | Ethernet50 |
| distribution_leaf | USOFFICE2_LEAF01B | Ethernet51 | l3spine | USOFFICE2_SPINE01 | Ethernet2 |
| distribution_leaf | USOFFICE2_LEAF01B | Ethernet52 | l3spine | USOFFICE2_SPINE02 | Ethernet2 |
| distribution_leaf | USOFFICE2_LEAF02A | Ethernet1 | l2subleaf | USOFFICE2_SUBLEAF02C | Ethernet49 |
| distribution_leaf | USOFFICE2_LEAF02A | Ethernet2 | l2subleaf | USOFFICE2_SUBLEAF02D | Ethernet49 |
| distribution_leaf | USOFFICE2_LEAF02A | Ethernet49 | mlag_peer | USOFFICE2_LEAF02B | Ethernet49 |
| distribution_leaf | USOFFICE2_LEAF02A | Ethernet50 | mlag_peer | USOFFICE2_LEAF02B | Ethernet50 |
| distribution_leaf | USOFFICE2_LEAF02A | Ethernet51 | l3spine | USOFFICE2_SPINE01 | Ethernet3 |
| distribution_leaf | USOFFICE2_LEAF02A | Ethernet52 | l3spine | USOFFICE2_SPINE02 | Ethernet3 |
| distribution_leaf | USOFFICE2_LEAF02B | Ethernet1 | l2subleaf | USOFFICE2_SUBLEAF02C | Ethernet50 |
| distribution_leaf | USOFFICE2_LEAF02B | Ethernet2 | l2subleaf | USOFFICE2_SUBLEAF02D | Ethernet50 |
| distribution_leaf | USOFFICE2_LEAF02B | Ethernet51 | l3spine | USOFFICE2_SPINE01 | Ethernet4 |
| distribution_leaf | USOFFICE2_LEAF02B | Ethernet52 | l3spine | USOFFICE2_SPINE02 | Ethernet4 |
| l3spine | USOFFICE2_SPINE01 | Ethernet49 | mlag_peer | USOFFICE2_SPINE02 | Ethernet49 |
| l3spine | USOFFICE2_SPINE01 | Ethernet50 | mlag_peer | USOFFICE2_SPINE02 | Ethernet50 |
| internet_leaves | USOFFICE3_INTERNET_LEAF01 | Ethernet49 | l3spine | USOFFICE3_SPINE01 | Ethernet47 |
| internet_leaves | USOFFICE3_INTERNET_LEAF01 | Ethernet50 | l3spine | USOFFICE3_SPINE02 | Ethernet47 |
| internet_leaves | USOFFICE3_INTERNET_LEAF02 | Ethernet49 | l3spine | USOFFICE3_SPINE01 | Ethernet48 |
| internet_leaves | USOFFICE3_INTERNET_LEAF02 | Ethernet50 | l3spine | USOFFICE3_SPINE02 | Ethernet48 |
| distribution_leaf | USOFFICE3_LEAF01A | Ethernet1 | l2subleaf | USOFFICE3_SUBLEAF01C | Ethernet49 |
| distribution_leaf | USOFFICE3_LEAF01A | Ethernet2 | l2subleaf | USOFFICE3_SUBLEAF01D | Ethernet49 |
| distribution_leaf | USOFFICE3_LEAF01A | Ethernet49 | mlag_peer | USOFFICE3_LEAF01B | Ethernet49 |
| distribution_leaf | USOFFICE3_LEAF01A | Ethernet50 | mlag_peer | USOFFICE3_LEAF01B | Ethernet50 |
| distribution_leaf | USOFFICE3_LEAF01A | Ethernet51 | l3spine | USOFFICE3_SPINE01 | Ethernet1 |
| distribution_leaf | USOFFICE3_LEAF01A | Ethernet52 | l3spine | USOFFICE3_SPINE02 | Ethernet1 |
| distribution_leaf | USOFFICE3_LEAF01B | Ethernet1 | l2subleaf | USOFFICE3_SUBLEAF01C | Ethernet50 |
| distribution_leaf | USOFFICE3_LEAF01B | Ethernet2 | l2subleaf | USOFFICE3_SUBLEAF01D | Ethernet50 |
| distribution_leaf | USOFFICE3_LEAF01B | Ethernet51 | l3spine | USOFFICE3_SPINE01 | Ethernet2 |
| distribution_leaf | USOFFICE3_LEAF01B | Ethernet52 | l3spine | USOFFICE3_SPINE02 | Ethernet2 |
| distribution_leaf | USOFFICE3_LEAF02A | Ethernet1 | l2subleaf | USOFFICE3_SUBLEAF02C | Ethernet49 |
| distribution_leaf | USOFFICE3_LEAF02A | Ethernet2 | l2subleaf | USOFFICE3_SUBLEAF02D | Ethernet49 |
| distribution_leaf | USOFFICE3_LEAF02A | Ethernet49 | mlag_peer | USOFFICE3_LEAF02B | Ethernet49 |
| distribution_leaf | USOFFICE3_LEAF02A | Ethernet50 | mlag_peer | USOFFICE3_LEAF02B | Ethernet50 |
| distribution_leaf | USOFFICE3_LEAF02A | Ethernet51 | l3spine | USOFFICE3_SPINE01 | Ethernet3 |
| distribution_leaf | USOFFICE3_LEAF02A | Ethernet52 | l3spine | USOFFICE3_SPINE02 | Ethernet3 |
| distribution_leaf | USOFFICE3_LEAF02B | Ethernet1 | l2subleaf | USOFFICE3_SUBLEAF02C | Ethernet50 |
| distribution_leaf | USOFFICE3_LEAF02B | Ethernet2 | l2subleaf | USOFFICE3_SUBLEAF02D | Ethernet50 |
| distribution_leaf | USOFFICE3_LEAF02B | Ethernet51 | l3spine | USOFFICE3_SPINE01 | Ethernet4 |
| distribution_leaf | USOFFICE3_LEAF02B | Ethernet52 | l3spine | USOFFICE3_SPINE02 | Ethernet4 |
| l3spine | USOFFICE3_SPINE01 | Ethernet49 | mlag_peer | USOFFICE3_SPINE02 | Ethernet49 |
| l3spine | USOFFICE3_SPINE01 | Ethernet50 | mlag_peer | USOFFICE3_SPINE02 | Ethernet50 |

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
| 172.16.1.0/24 | 256 | 14 | 5.47 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| INOFFICE1 | INOFFICE1_SPINE01 | 172.16.1.1/32 |
| INOFFICE1 | INOFFICE1_SPINE02 | 172.16.1.2/32 |
| INOFFICE2 | INOFFICE2_SPINE01 | 172.16.1.1/32 |
| INOFFICE2 | INOFFICE2_SPINE02 | 172.16.1.2/32 |
| UKOFFICE1 | UKOFFICE1_SPINE01 | 172.16.1.1/32 |
| UKOFFICE1 | UKOFFICE1_SPINE02 | 172.16.1.2/32 |
| UKOFFICE2 | UKOFFICE2_SPINE01 | 172.16.1.1/32 |
| UKOFFICE2 | UKOFFICE2_SPINE02 | 172.16.1.2/32 |
| USOFFICE1 | USOFFICE1_SPINE01 | 172.16.1.1/32 |
| USOFFICE1 | USOFFICE1_SPINE02 | 172.16.1.2/32 |
| USOFFICE2 | USOFFICE2_SPINE01 | 172.16.1.1/32 |
| USOFFICE2 | USOFFICE2_SPINE02 | 172.16.1.2/32 |
| USOFFICE3 | USOFFICE3_SPINE01 | 172.16.1.1/32 |
| USOFFICE3 | USOFFICE3_SPINE02 | 172.16.1.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------------ | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
