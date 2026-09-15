Ansible playbook for TDS application operation  

--- Ansible Tower survey ---

target_server : hostname  
target_action : { start | stop }  
target_service:  
  - ALL  
  - airflow    
  - nifi   
  - tds_bt   
  - tds_ui   


--- main playbook ---    
tds.yaml           

--- tasks ---    
airflow.yaml    
nifi.yaml  
tds_bt.yaml  
tds_ui.yaml  

--- var file ---  
run_accounts.yaml  # run accoutn map for hosts  

