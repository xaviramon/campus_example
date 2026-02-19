# USOFFICE3_SPINE01

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Enable Password](#enable-password)
- [MLAG](#mlag)
  - [MLAG Summary](#mlag-summary)
  - [MLAG Device Configuration](#mlag-device-configuration)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
  - [VLAN Interfaces](#vlan-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | OOB_MANAGEMENT | oob | MGMT | 172.16.100.101/24 | - |

##### IPv6

| Management Interface | Description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | OOB_MANAGEMENT | oob | MGMT | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management1
   description OOB_MANAGEMENT
   no shutdown
   vrf MGMT
   ip address 172.16.100.101/24
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | UNIX-Socket | Default Services |
| ---- | ----- | ----------- | ---------------- |
| False | True | - | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| MGMT | - | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf MGMT
      no shutdown
```

## Authentication

### Enable Password

Enable password has been disabled

## MLAG

### MLAG Summary

| Domain-id | Local-interface | Peer-address | Peer-link |
| --------- | --------------- | ------------ | --------- |
| USOFFICE3_SPINES | Vlan4094 | 192.168.0.1 | Port-Channel49 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id USOFFICE3_SPINES
   local-interface Vlan4094
   peer-address 192.168.0.1
   peer-link Port-Channel49
   reload-delay mlag 300
   reload-delay non-mlag 330
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 4096 |

#### Global Spanning-Tree Settings

- Spanning Tree disabled for VLANs: **4093-4094**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4093-4094
spanning-tree mst 0 priority 4096
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ----------------- | --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Device Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 1000 | TEST_USOFFICE3 | - |
| 4094 | MLAG | MLAG |

### VLANs Device Configuration

```eos
!
vlan 1000
   name TEST_USOFFICE3
!
vlan 4094
   name MLAG
   trunk group MLAG
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet1 | L2_USOFFICE3_LEAF01A_Ethernet51 | *trunk | *1000 | *- | *- | 1 |
| Ethernet2 | L2_USOFFICE3_LEAF01B_Ethernet51 | *trunk | *1000 | *- | *- | 1 |
| Ethernet3 | L2_USOFFICE3_LEAF02A_Ethernet51 | *trunk | *1000 | *- | *- | 3 |
| Ethernet4 | L2_USOFFICE3_LEAF02B_Ethernet51 | *trunk | *1000 | *- | *- | 3 |
| Ethernet10 | SERVER_USOFFICE3_SPINE_Eth10_FW01A | *trunk | *- | *- | *- | 10 |
| Ethernet47 | L2_USOFFICE3_INTERNET_LEAF01_Ethernet49 | *trunk | *1000 | *- | *- | 47 |
| Ethernet48 | L2_USOFFICE3_INTERNET_LEAF02_Ethernet49 | *trunk | *1000 | *- | *- | 48 |
| Ethernet49 | MLAG_USOFFICE3_SPINE02_Ethernet49 | *trunk | *- | *- | *MLAG | 49 |
| Ethernet50 | MLAG_USOFFICE3_SPINE02_Ethernet50 | *trunk | *- | *- | *MLAG | 49 |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description L2_USOFFICE3_LEAF01A_Ethernet51
   shutdown
   channel-group 1 mode active
!
interface Ethernet2
   description L2_USOFFICE3_LEAF01B_Ethernet51
   shutdown
   channel-group 1 mode active
!
interface Ethernet3
   description L2_USOFFICE3_LEAF02A_Ethernet51
   shutdown
   channel-group 3 mode active
!
interface Ethernet4
   description L2_USOFFICE3_LEAF02B_Ethernet51
   shutdown
   channel-group 3 mode active
!
interface Ethernet10
   description SERVER_USOFFICE3_SPINE_Eth10_FW01A
   no shutdown
   channel-group 10 mode active
!
interface Ethernet47
   description L2_USOFFICE3_INTERNET_LEAF01_Ethernet49
   shutdown
   channel-group 47 mode active
!
interface Ethernet48
   description L2_USOFFICE3_INTERNET_LEAF02_Ethernet49
   shutdown
   channel-group 48 mode active
!
interface Ethernet49
   description MLAG_USOFFICE3_SPINE02_Ethernet49
   no shutdown
   channel-group 49 mode active
!
interface Ethernet50
   description MLAG_USOFFICE3_SPINE02_Ethernet50
   no shutdown
   channel-group 49 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | --------------------- | ------------------ | ------- | -------- |
| Port-Channel1 | L2_USOFFICE3_LEAF01_Port-Channel51 | trunk | 1000 | - | - | - | - | 1 | - |
| Port-Channel3 | L2_USOFFICE3_LEAF02_Port-Channel51 | trunk | 1000 | - | - | - | - | 3 | - |
| Port-Channel10 | SERVER_USOFFICE3_SPINE_Eth10 | trunk | - | - | - | - | - | 10 | - |
| Port-Channel47 | L2_USOFFICE3_INTERNET_LEAF01_Port-Channel49 | trunk | 1000 | - | - | - | - | 47 | - |
| Port-Channel48 | L2_USOFFICE3_INTERNET_LEAF02_Port-Channel49 | trunk | 1000 | - | - | - | - | 48 | - |
| Port-Channel49 | MLAG_USOFFICE3_SPINE02_Port-Channel49 | trunk | - | - | MLAG | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel1
   description L2_USOFFICE3_LEAF01_Port-Channel51
   no shutdown
   switchport trunk allowed vlan 1000
   switchport mode trunk
   switchport
   mlag 1
!
interface Port-Channel3
   description L2_USOFFICE3_LEAF02_Port-Channel51
   no shutdown
   switchport trunk allowed vlan 1000
   switchport mode trunk
   switchport
   mlag 3
!
interface Port-Channel10
   description SERVER_USOFFICE3_SPINE_Eth10
   no shutdown
   switchport mode trunk
   switchport
   mlag 10
   spanning-tree portfast
   spanning-tree bpduguard enable
!
interface Port-Channel47
   description L2_USOFFICE3_INTERNET_LEAF01_Port-Channel49
   no shutdown
   switchport trunk allowed vlan 1000
   switchport mode trunk
   switchport
   mlag 47
!
interface Port-Channel48
   description L2_USOFFICE3_INTERNET_LEAF02_Port-Channel49
   no shutdown
   switchport trunk allowed vlan 1000
   switchport mode trunk
   switchport
   mlag 48
!
interface Port-Channel49
   description MLAG_USOFFICE3_SPINE02_Port-Channel49
   no shutdown
   switchport mode trunk
   switchport trunk group MLAG
   switchport
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | ROUTER_ID | default | 172.16.1.1/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | ROUTER_ID | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description ROUTER_ID
   no shutdown
   ip address 172.16.1.1/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF | MTU | Shutdown |
| --------- | ----------- | --- | --- | -------- |
| Vlan4094 | MLAG | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ------ | ------- |
| Vlan4094 | default | 192.168.0.0/31 | - | - | - | - |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan4094
   description MLAG
   no shutdown
   mtu 9214
   no autostate
   ip address 192.168.0.0/31
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### Virtual Router MAC Address

#### Virtual Router MAC Address Summary

Virtual Router MAC Address: 00:1c:73:00:dc:01

#### Virtual Router MAC Address Device Configuration

```eos
!
ip virtual-router mac-address 00:1c:73:00:dc:01
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| MGMT | False |

#### IP Routing Device Configuration

```eos
!
ip routing
no ip routing vrf MGMT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| MGMT | false |

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| MGMT | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance MGMT
```
