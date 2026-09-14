This is ansible playbook for oracle client patching for Riskreg applications

 - Oracle client patching source is from NFS - 172.100.1.231:/export/ansible/ORAPATCH, it will be mounted to /tmp/oracle and will be unmount after patching.
 
 - if NFS cannot be mounted, please copy the source (full folder, not compressed file) to server locally and create soft link /tmp/oracle points to the local source, as the same folder structure in NFS
 
 - This playbook expects $ORACLE_HOME is defined and exported before running the playbook.

Survey in template:

Backup Directory : Path to store the backup tar ball of the oracle base directory
Oracle Base Directory : Full path of Oracle base directory
Oracle client account : account which owns the $ORACLE_HOME
Patch files source : 

	NFS - it will mount /tmp/oracle to 172.100.1.231:/export/ansible/ORAPATCH and unmount after patching is completed.
	local - it will search for oracle patch in /tmp/oracle, playbook will be failed if patch folders not found.
	
list of patch ID: Number only - omit the prefix, separate each patch ID by space if it is more than one
email : Email address to receive notification once patching is completed