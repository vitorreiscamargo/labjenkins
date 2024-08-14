create_aks:
	@cd ./terraform && terraform apply --auto-approve

create_kind:
	@kind create cluster --config config.yaml

metallb: 
	@kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
	@kubectl wait --namespace metallb-system  --for=condition=ready pod --selector=app=metallb --timeout=90s

helm:
	@helmfile apply 
