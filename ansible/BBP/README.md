Ansible playbook for BBP application operation  

--- Ansible Tower survey ---

target_server : hostname  
target_action : { start | stop }  
target_container: 
  - ALL   
  - etl   
  - im   
  - tfrm  

--- main playbook ---  
bbp-prod.yaml      - PROD env  
bbp-nonprod.yaml   - non-prod env  
gss.yaml           - turn on / off listening port for dynamic DNS failover  

--- tasks ---

bbp.yaml  
bbp-etl.yaml  

===============================================

Ansible playbook for BBP DNS failover  

===============================================  

--- Ansible Tower survey ---  

target_server    : hostname  
target_action    : { no_action | start | stop }     # start or stop listening port service, default : no_action  
DNS Name         : { bbp.int.ca | bbp-im.int.ca }   # DNS name in action
Enable / Disable : { no_action | enable | disable } # enable or disable as system service,  default : no_action  
  - enable  
  - disable  