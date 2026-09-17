GSP314 - Set Up a Google Cloud Network: Challenge Lab


Challenge scenario

You are tasked with setting up a Virtual Private Cloud (VPC) network in Google Cloud Platform (GCP) and ensuring proper connectivity between virtual machines (VMs) in different subnets. You will also configure firewall rules to manage access and test network connectivity between the VMs.

As part of this challenge, you will need to create the following:

A VPC network with two subnetworks and firewalls need to be created to connect new resources together.
Launch two VMs in each subnet and verify that these machines can successfully communicate with each other using the protocols you've configured.


Task 1. Create networks

Create a VPC network with two subnets and firewalls to open connections between resources.

Create a VPC network named vpc-network-9zki with two subnets: subnet-a-jqeh and subnet-b-0yde. Use a Regional dynamic routing mode.

For subnet-a-jqeh set the region to us-central1.

Set the IP stack type to IPv4 (single-stack)
Set IPv4 range to 10.10.10.0/24
For subnet-b-0yde set the region to us-east4.

Set the IP stack type to IPv4 (single-stack)
Set IPv4 range to 10.10.20.0/24


Task 2. Add firewall rules

On this network your team will need to be able to connect to Linux and Windows machines using SSH and RDP, as well as diagnose network communication issues via ICMP.

Create a firewall rule named quqq-firewall-ssh.

For the network, use vpc-network-9zki.
Set the priority to 1000, the traffic to Ingress and action to Allow
The targets should be set to all instances in the network and the IPv4 ranges to 0.0.0.0/0
Set the Protocol to TCP and port to 22
Create a firewall rule named csza-firewall-rdp.

For the network, use vpc-network-9zki.
Set the priority to 65535, the traffic to Ingress and action to Allow
The targets should be set to all instances in the network and the IPv4 ranges to 0.0.0.0/24
Set the Protocol to TCP and port to 3389
Create a firewall rule named ltrr-firewall-icmp.

For the network, use vpc-network-9zki.
Set the priority to 1000, the traffic to Ingress and action to Allow
The targets should be set to all instances in the network and the IPv4 ranges to 10.10.10.0/24 and 10.10.20.0/24
Set the Protocol to icmp



Task 3. Add VMs to your network

Create a virtual machine in each subnet, and confirm that the machines can communicate with each other using a protocol that you already set up. Each machine will use network tags that the firewall rules need to allow network traffic.

Create an instance name us-test-01 in subnet-a-jqeh and set the zone to us-central1-b. Set the Machine type to e2-standard-2

Create an instance name us-test-02 in subnet-b-0yde and set the zone to us-east4-a. Set the Machine type to e2-standard-2