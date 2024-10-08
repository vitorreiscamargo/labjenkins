# create_aks:
# 	@cd ./terraform && terraform apply --auto-approve

# create_kind:
# 	@kind create cluster --config config.yaml

# metallb: 
# 	@kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
# 	@kubectl wait --namespace metallb-system  --for=condition=ready pod --selector=app=metallb --timeout=90s

helm:
	@helmfile apply 

get_secret_jenkins:
	@kubectl get secret jenkins -n jenkins -ojson | jq -r '.data["jenkins-admin-password"], .data["jenkins-admin-user"]' | base64 --decode

get_secret_argocd:
	@kubectl get secret argocd-initial-admin-secret -n argocd -ojson | jq -r '.data["password"]' | base64 --decode