#!/bin/bash
# Basic terraform test on a config. Params: $1 is the directory name
set -e
pushd "$1"
terraform init
terraform validate
# Create
terraform plan
terraform apply -auto-approve
terraform plan | grep "No changes"
sleep 1
terraform destroy -auto-approve
popd