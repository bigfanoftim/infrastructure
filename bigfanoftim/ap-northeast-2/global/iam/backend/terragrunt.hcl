include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../../modules/iam/user"
}

inputs = {
  user = {
    name = "backend"
    tags = {
      Name = "backend engineer"
    }
  }

  policy = {
    name        = "policy-for-backend"
    description = "policy-for-backend"
    policy      = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect": "Allow",
          "Action": [
            "s3:ListBucket",
            "s3:GetBucketLocation",
            "s3:ListBucketMultipartUploads"
          ],
          "Resource": "*"
        },
        {
          "Effect": "Allow",
          "Action": [
            "cloudfront:GetDistribution",
            "cloudfront:GetDistributionConfig",
            "cloudfront:ListDistributions"
          ],
          "Resource": "*"
        }
      ]
    })
  }
}
