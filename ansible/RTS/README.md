Ansible playbook for RTS application operation  

--- main playbook ---  
prod.yaml           - PROD env   
nonprod.yaml        - non-prod env   

--- tasks ---  

crontab_rtsrun.yaml - disable crontab before patching and enable after patching  
lb.yaml  	        - stop / start LB services (only for prod)         
monitoring.yaml		- disable / enable process monitoring for patching  
supervisorctl.yaml  - stop / start supervisorctl control  

