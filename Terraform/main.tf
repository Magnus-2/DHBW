##############################################################
### This is the main.tf you can choose between ###############
### stackit_ske_kubeconfig to create a kubeconfig and ########
### stackit_ske_cluster to create a new cluster ##############
### bothe configurations can be startet with terraform apply #
### If it is you First run please use terraform init #########
### In case you need more informations visit Terraform #######
### https://registry.terraform.io/namespaces/stackitcloud ####
##############################################################

##################################################################
### This part of the script defines the provieder which we use ###
##################################################################
terraform {
  required_providers {
    stackit = {
      source = "stackitcloud/stackit"
      version = "0.18.1"
    }
  }
}

######################################################################
### This part of the script authenitcats the service account which ###
### terraform will use to run the tasks on the stackit cloud #########
###################################################################### 
provider "stackit" {
    region = "eu01"
  service_account_email = "dhbw-kube-mf-wjy1zd1@sa.stackit.cloud"
  service_account_token = "eyJraWQiOiJOemRtTUdNNE1EWm1aamRqT0dZME9XUTVNekF6TTJNNU1qRmhNV05qTWpVIiwiYWxnIjoiUlM1MTIifQ.eyJzdWIiOiI1NDg1OWY4MS00NjVhLTRhNDAtODc5Ny0wNmZmMGRjOWUyODAiLCJpc3MiOiJzdGFja2l0L3NlcnZpY2VhY2NvdW50IiwiYXVkIjpbInN0YWNraXQiLCJhcGkiXSwic3RhY2tpdC9zZXJ2aWNlYWNjb3VudC90b2tlbi5zb3VyY2UiOiJsZWdhY3kiLCJzdGFja2l0L3NlcnZpY2VhY2NvdW50L25hbWVzcGFjZSI6ImFwaSIsInN0YWNraXQvcHJvamVjdC9wcm9qZWN0LmlkIjoiMDkxNmRkOWYtMzUwZC00OTEzLTkzNzUtYTRhMzk0MWVjNTRjIiwiYXpwIjoiNjJmMTY3MDgtMTc0Mi00OTJhLTk0MzItMmQ0ODg3MmJkYjI3Iiwic3RhY2tpdC9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiNTQ4NTlmODEtNDY1YS00YTQwLTg3OTctMDZmZjBkYzllMjgwIiwiZXhwIjoxNzMyOTkzMjM0LCJpYXQiOjE3MTc0NDEyMzQsImVtYWlsIjoiZGhidy1rdWJlLW1mLXdqeTF6ZDFAc2Euc3RhY2tpdC5jbG91ZCIsImp0aSI6IjdhODBmYjgwLWExOGUtNDMxYi1hNTViLTE0MzJiZTA3ZjFlOSJ9.KkcWtBf3AJimlOjTMfSsrigEe6TRhPp3Gr64W5T2hqcE0z4-zz0icqqoggAywLmtfKOBt_fRkGkY4bPia0VVXG4pjtE1knaQR6ShtvczGJxcj7yPYfW9D-Delh4Y_AwzJCgYOQzA_5LTOKW6ZQk8rKjceldw71AMKWQO06LfJ332IpHvvdDwVTfcjGFImr0lbxKOeQrqzl_OsDujtybWGSgw6L7g5IyTKoWzYd1UdHqXnzkFHNyQ0T7aWWucj5o-iRltzwtQFFyBU4VJOA_5yrCdrG0G1BrrgXpusWuc98t_clWvGd2CyhpwLlyF2QBoHs5GJiISBPyPKfnvKUFeYQ"
}
####################################################################
### the stackit_ske_kubeconfig konfiguration for the test-system ###
####################################################################

# resource "stackit_ske_kubeconfig" "k8-mfc" {
#   project_id   = "0916dd9f-350d-4913-9375-a4a3941ec54c"
#   cluster_name = "k8-mf"
#   refresh      = true
# }

#################################################################
### the stackit_ske_cluster konfiguration for the test-system ###
#################################################################

# resource "stackit_ske_cluster" "example" {
#   project_id         = "0916dd9f-350d-4913-9375-a4a3941ec54c"
#   name               = "example2"
#   kubernetes_version_min = "1.28.9"
#   node_pools = [
#     {
#       name               = "np-example"
#       machine_type       = "c1a.2d"
#       os_name            = "flatcar"
#       os_version         = "3815.2.1"
#       minimum            = "1"
#       maximum            = "1"
#       availability_zones = ["eu01-3"]
#     }
#   ]

#   maintenance = {
#     enable_kubernetes_version_updates    = true
#     enable_machine_image_version_updates = true
#     start                                = "01:00:00Z"
#     end                                  = "02:00:00Z"
#   }
# }


