# Stellaris Insights Terraform

## Initial setup (One time)

1. `cd s3-backend`
2. Configure bucket name (These are unique in all of AWS)
3. `terraform init`
4. `terraform apply`
5. `cd ../`
6. Configure bucket name (Same name from step 2)
7. `terraform init`
8. `terraform apply`

### Caveats

Currently waiting on 1.51 of the aws provider to be released. In the mean time you can use the code on github.

To install the current development branch of aws provider: (You need golang setup and configured)

1. go get github.com/terraform-providers/terraform-provider-aws
2. mkdir ~/.terraform.d/plugins
3. cp \$GOPATH/bin/terraform-provider-aws ~/.terraform.d/plugins
