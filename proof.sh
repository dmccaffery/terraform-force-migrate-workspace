#! /usr/bin/env sh

# initialise some state with the default local backend in any workspace
terraform init -input=false
terraform workspace select example || terraform workspace new example
terraform apply -auto-approve -input=false

# this should work, but it doesn't -- it prompts for verification
TF_LOG=trace terraform init -migrate-state -force-copy -input=false -backend-config=backends/local.hcl

# cleanup for a re-run
terraform apply -destroy -auto-approve -input=false
