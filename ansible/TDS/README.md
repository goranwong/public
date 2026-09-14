Ansible playbook for TDS application operation

--- main playbook ---
tds.yaml           - PROD env
tds-nonprod.yaml   - non-prod env

tasks - tasks playbook to stop and start specific application componments, depending on the choice in main playbook
---
airflow.yaml
nifi.yaml
tds_bt.yaml
tds_ui.yaml

