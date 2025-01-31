include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../modules/network/vpc"
}

inputs = {
  vpc = {
    cidr_block = "10.0.0.0/16"
    tags       = {
      Name = "dev"
    }
  }

  internet_gateway = {
    tags = {
      Name = "dev-vpc"
    }
  }

  public_subnets = {
    ap_northeast_2a = {
      az         = "ap-northeast-2a"
      cidr_block = "10.0.0.0/20"
      tags       = {
        Name = "dev-public-ap-northeast-2a"
      }
    }
    ap_northeast_2b = {
      az         = "ap-northeast-2b"
      cidr_block = "10.0.16.0/20"
      tags       = {
        Name = "dev-public-ap-northeast-2b"
      }
    }
    ap_northeast_2c = {
      az         = "ap-northeast-2c"
      cidr_block = "10.0.32.0/20"
      tags       = {
        Name = "dev-public-ap-northeast-2c"
      }
    }
    ap_northeast_2d = {
      az         = "ap-northeast-2d"
      cidr_block = "10.0.48.0/20"
      tags       = {
        Name = "dev-public-ap-northeast-2d"
      }
    }
  }

  public_route_table = {
    tags = {
      Name = "dev-public-routing-table"
    }
  }
}
