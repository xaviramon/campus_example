# USOFFICE1_LEAF02A

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
  - [VLAN Interfaces](#vlan-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
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
| Management1 | OOB_MANAGEMENT | oob | MGMT | 172.16.100.105/24 | - |

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
   ip address 172.16.100.105/24
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
| USOFFICE1_LEAF02 | Vlan4094 | 192.168.0.5 | Port-Channel49 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id USOFFICE1_LEAF02
   local-interface Vlan4094
   peer-address 192.168.0.5
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
| 0 | 16384 |

#### Global Spanning-Tree Settings

- Spanning Tree disabled for VLANs: **4094**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4094
spanning-tree mst 0 priority 16384
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
| 3000 | TEST_USOFFICE1 | - |
| 4094 | MLAG | MLAG |

### VLANs Device Configuration

```eos
!
vlan 3000
   name TEST_USOFFICE1
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
| Ethernet1 | L2_USOFFICE1_SUBLEAF02C_Ethernet49 | *trunk | *3000 | *- | *- | 1 |
| Ethernet2 | L2_USOFFICE1_SUBLEAF02D_Ethernet49 | *trunk | *3000 | *- | *- | 2 |
| Ethernet49 | MLAG_USOFFICE1_LEAF02B_Ethernet49 | *trunk | *- | *- | *MLAG | 49 |
| Ethernet50 | MLAG_USOFFICE1_LEAF02B_Ethernet50 | *trunk | *- | *- | *MLAG | 49 |
| Ethernet51 | L2_USOFFICE1_SPINE01_Ethernet3 | *trunk | *3000 | *- | *- | 51 |
| Ethernet52 | L2_USOFFICE1_SPINE02_Ethernet3 | *trunk | *3000 | *- | *- | 51 |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description L2_USOFFICE1_SUBLEAF02C_Ethernet49
   shutdown
   channel-group 1 mode active
!
interface Ethernet2
   description L2_USOFFICE1_SUBLEAF02D_Ethernet49
   shutdown
   channel-group 2 mode active
!
interface Ethernet49
   description MLAG_USOFFICE1_LEAF02B_Ethernet49
   no shutdown
   channel-group 49 mode active
!
interface Ethernet50
   description MLAG_USOFFICE1_LEAF02B_Ethernet50
   no shutdown
   channel-group 49 mode active
!
interface Ethernet51
   description L2_USOFFICE1_SPINE01_Ethernet3
   shutdown
   channel-group 51 mode active
!
interface Ethernet52
   description L2_USOFFICE1_SPINE02_Ethernet3
   shutdown
   channel-group 51 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | --------------------- | ------------------ | ------- | -------- |
| Port-Channel1 | L2_USOFFICE1_SUBLEAF02C_Port-Channel49 | trunk | 3000 | - | - | - | - | 1 | - |
| Port-Channel2 | L2_USOFFICE1_SUBLEAF02D_Port-Channel49 | trunk | 3000 | - | - | - | - | 2 | - |
| Port-Channel49 | MLAG_USOFFICE1_LEAF02B_Port-Channel49 | trunk | - | - | MLAG | - | - | - | - |
| Port-Channel51 | L2_USOFFICE1_SPINES_Port-Channel3 | trunk | 3000 | - | - | - | - | 51 | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel1
   description L2_USOFFICE1_SUBLEAF02C_Port-Channel49
   no shutdown
   switchport trunk allowed vlan 3000
   switchport mode trunk
   switchport
   mlag 1
!
interface Port-Channel2
   description L2_USOFFICE1_SUBLEAF02D_Port-Channel49
   no shutdown
   switchport trunk allowed vlan 3000
   switchport mode trunk
   switchport
   mlag 2
!
interface Port-Channel49
   description MLAG_USOFFICE1_LEAF02B_Port-Channel49
   no shutdown
   switchport mode trunk
   switchport trunk group MLAG
   switchport
!
interface Port-Channel51
   description L2_USOFFICE1_SPINES_Port-Channel3
   no shutdown
   switchport trunk allowed vlan 3000
   switchport mode trunk
   switchport
   mlag 51
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF | MTU | Shutdown |
| --------- | ----------- | --- | --- | -------- |
| Vlan4094 | MLAG | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ------ | ------- |
| Vlan4094 | default | 192.168.0.4/31 | - | - | - | - |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan4094
   description MLAG
   no shutdown
   mtu 9214
   no autostate
   ip address 192.168.0.4/31
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| MGMT | False |

#### IP Routing Device Configuration

```eos
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
