# Issue with Terraform Init Force Copy when Using Workspaces

Issue:

When using the `-force-copy` option with `terraform init -migrate-state` within a root module containing workspaces, a
prompt that requires acknowledgement that all workspaces will be migrated is required. There is currently no way to
automate the migration of state when using workspaces, such as in build pipeline.

Steps:

1. initialise and apply some state in a workspace

    ```hcl
    terraform init
    terraform workspace new example
    terraform apply -auto-approve -input false
    ```

2. attempt to migrate state using a new backend config

```hcl
terraform init -migrate-state -force-copy -input=false -backend-config=backends/local.tf
```

Expected results:

1. state is migrated successfully

Actual results:

1. state does not migrate and an error occurs because a prompt is required.

## Test Script

Use the `proof.sh` script as a proof for the issue:

```sh
sh proof.sh
```
