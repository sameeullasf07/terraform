provider "aws" {
  region = "us-east-1"
}
data "aws_eks_cluster" "example" {
  name = "example"
}

output "endpoint" {
  value = data.aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = data.aws_eks_cluster.example.certificate_authority[0].data
}

# Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019.
output "identity-oidc-issuer" {
  value = data.aws_eks_cluster.example.identity[0].oidc[0].issuer
}
