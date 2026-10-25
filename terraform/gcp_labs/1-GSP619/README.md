In this lab, I created 2 different vpcs and subnets in single loop by using dynamic block 


Setup and requirements
For this lab, you will set up two VPCs and add a cloud HA-VPN gateway in each. You will run two tunnels from each VPN gateway to demonstrate the HA-VPN gateway configuration for 99.99% SLA.

You will create a global VPC network, vpc-demo, with two custom subnets in REGION 2 and REGION 1. In this VPC, you will add a Compute Engine instance in each region. You will create a second vpc on-prem to simulate customer's on-prem data center. In this VPC, you will add a subnet in region REGION 1 and an instance running in this region. You will then add Cloud HA-VPN and a cloud router in each vpc, and run two tunnels from each cloud HA-VPN gateway.


Task 1. Cloud VPC setup

create a vpc network called vpc-demo

create subnet vpc-demo-subnet1 in REGION 1 region:

Create a firewall rule to allow all internal traffic within the network

Create a firewall rule to allow ssh, icmp from anywhere

Create a vm instance vpc-demo-instance1 in zone ZONE 2

Create a vm instance vpc-demo-instance2 in zone ZONE