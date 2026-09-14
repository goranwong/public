This is ansible playbook to turn on / off DNS listening port system service. For DNS failover purpose.  

==========================================

variables    

==========================================

target_host: hostname  

target_action: "start" or "stop" or "no_action"  

	- "start" 		: start the listening port  
	- "stop"  		: stop the listening port  
	- "no_action"   : no action will be taken (skip)  
	
target_option: "enable" or "disable" or "no_action"  

	- "enable" 		: enable the listening port service as system service  
	- "stop"   		: disable the listening port service as system service  
	- "no_action"   : no action will be taken (skip)  