#!/bin/bash

TERRAFORM_DIR="./.terraform" 

destroy_infra() {
    echo "Destruction de l'infrastructure :"
    terraform destroy -auto-approve
}

if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "Le répertoire $TERRAFORM_DIR n'existe pas."
else
    if destroy_infra; then
        echo "Infrastructure détruite."
    else
        echo "Erreur. Infrastructure non détruite."
    fi
fi