# Stellaris Insights Terraform

## Initial setup (One time)

1. Configure bucket name in modules/s3-backend/main.tf (These are unique in all of AWS)
2. `cd setup`
3. `terraform get`
4. `terraform init`
5. `terraform apply`
6. `cp terraform.tfstate ../`
7. `terraform output > ../config.backend`
8. `cd ../`
9. `terraform get`
10. `terraform init -backend-config=./config.backend`
11. `terraform apply`

### Caveats

Currently waiting on 1.51 of the aws provider to be released. In the mean time you can use the code on github.

To install the current development branch of aws provider: (You need golang setup and configured)

1. go get github.com/terraform-providers/terraform-provider-aws
2. mkdir ~/.terraform.d/plugins
3. cp \$GOPATH/bin/terraform-provider-aws ~/.terraform.d/plugins
