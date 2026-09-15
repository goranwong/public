This is ansible playbook for oracle client patching 

 - Oracle client patching source is from NFS - 172.100.1.231:/export/ansible/ORAPATCH, it will be mounted to /tmp/oracle and will be unmount after patching.  
 
 - if NFS cannot be mounted, please copy the source (full folder, not compressed file) to server locally and create soft link /tmp/oracle points to the local source, as the same folder structure in NFS  
 
 - This playbook expects $ORACLE_HOME is defined and exported before running the playbook.  

Survey in template:  

--- Ansible Tower survey ---

target_server : hostname  
Backup Directory : < Full path of directory for the backup >     
Oracle Base Directory : < Base Directory of Oracle Client >  
Patch files source { NFS (default) | local }  #source of patch files  
oracle client account : oracle (default)  
list of patch ID : < Number only - omit the prefix, separate each patch ID by space if it is more than one >  

