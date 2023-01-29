deploy: deploy_to_prod

deploy_to_prod:
	ansible-playbook -i ansible-rails/inventories/production.ini ansible-rails/deploy.yml --vault-password-file ansible-rails/.vault_pass
