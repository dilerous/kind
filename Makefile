all: build ingress

build:
				kind create cluster --config=cluster.yaml

delete:
				kind delete cluster

ingress:
				kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kuard:
				kubectl apply -f ./kuard

certmanager:
				helm upgrade -i -n cert-manager cert-manager jetstack/cert-manager --create-namespace --version v1.14.3 --set installCRDs=true

godaddy:
				helm upgrade -i godaddy-webhook godaddy-webhook/godaddy-webhook \
    		--set groupName=kind.dilerous.cloud  \
    		--set image.tag=v1.27.1 \
    		--set image.pullPolicy=Always \
    		--namespace cert-manager
