provider "aws" {
  region = "ap-southeast-1"
}

module "alb-single-listener" {
  source                   = "../.."
  lb_logs_s3_bucket_name   = "lb-logs-bucket"
  service_name             = "fprbc"
  cluster_role             = "app"
  environment              = "production"
  product_domain           = "fpr"
  description              = "Flight BC Apps Application Load Balancer"
  listener_certificate_arn = "arn:aws:acm:ap-southeast-1:123456789012:certificate/certificate-arn-suffix"
  lb_security_groups       = ["sg-123abc"]
  lb_subnet_ids            = ["subnet-123abc", "subnet-456def"]
  vpc_id                   = "vpc-123abc"
}
