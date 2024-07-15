create:
	@cd ./terraform && terraform apply --auto-approve

helm:
	@helmfile apply 