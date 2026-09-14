Ansible playbook for FNBS application operation

--- main playbook ---
fnbs.yaml           - PROD env


tasks - tasks playbook to stop and start specific application componments, depending on the choice in main playbook
---
airflow
fnbs-ae-etl
fnbs-report
fnbs-rws
fnbs-starter
fnbs-tools
fnbs-ui
refdata-service

