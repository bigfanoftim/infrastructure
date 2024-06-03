# ---------------------------------------------------------------------------------------------------------------------
# RESOURCES
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_user" "main" {
  name          = var.user.name
  force_destroy = true

  tags = var.user.tags
}

resource "aws_iam_policy" "main" {
  name        = var.policy.name
  description = var.policy.description
  policy      = var.policy.policy
}

resource "aws_iam_user_policy_attachment" "main" {
  user       = aws_iam_user.main.name
  policy_arn = aws_iam_policy.main.arn
}

resource "aws_iam_user_login_profile" "main" {
  user                    = aws_iam_user.main.name
  password_reset_required = true
  pgp_key                 = filebase64("iam-pgp-key")
}

# ---------------------------------------------------------------------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "user" {
  type = object({
    name = string
    tags = map(string)
  })
}

variable "policy" {
  type = object({
    name        = string
    description = string
    policy      = string // JSON 형식의 IAM 정책 문자열
  })
}

# ---------------------------------------------------------------------------------------------------------------------
# OUTPUTS
# ---------------------------------------------------------------------------------------------------------------------
output "arn" {
  value = aws_iam_user.main.arn
}

output "password" {
  value = aws_iam_user_login_profile.main.encrypted_password
}
