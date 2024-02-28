all: build ingress

build:
				kind create cluster --config=cluster.yaml

delete:
				kind delete cluster

ingress:
				kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kuard:
				kubectl apply -f ./kuard
