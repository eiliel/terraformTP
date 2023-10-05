#!/bin/bash

TERRAFORM_DIR="./.terraform" 
URL="http://localhost:8082"

deploy_infra() {
    echo "Déploiement de l'infrastructure :"
    terraform init
    terraform plan
    terraform apply -auto-approve
}

if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "Le répertoire $TERRAFORM_DIR n'existe pas."
else
    if deploy_infra; then
        echo "Infrastructure déployée."
        xdg-open "$URL"
    else
        echo "Erreur. Infrastructure non déployée."
    fi
fi