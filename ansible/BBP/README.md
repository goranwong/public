Ansible playbook for BBP application operation  

--- main playbook ---  
bbp-prod.yaml      - PROD env  
bbp-nonprod.yaml   - non-prod env  
gss.yaml           - turn on / off listening port for dynamic DNS failover  

tasks playbook to stop and start podman containers - host dependent  

bbp.yaml  
bbp-etl.yaml  
