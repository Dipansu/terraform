module "s3creation" {
  source = "../modules/s3"
}

module "iam_role_user" {
  depends_on      = [module.s3creation]
  source          = "../modules/iam"
  resource_module = module.s3creation.s3_arn
}
module "ec2_creation" {
  source  = "../modules/ec2"
  counter = var.counter_module
  ec2_creaTe = var.ec2_creaTe_module

}