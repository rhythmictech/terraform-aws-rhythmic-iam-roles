resource "aws_iam_role" "FullAdminAccess_role" {
  name                 = "${var.role_prefix}FullAdminAccess"
  max_session_duration = 7200
  path                 = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "AWS": "arn:aws:iam::${var.master_account}:root"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "FullAdminAccess_role_policy_attach" {
  role       = aws_iam_role.FullAdminAccess_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role" "StandardAdminAccess_role" {
  name                 = "${var.role_prefix}StandardAdminAccess"
  max_session_duration = 7200
  path                 = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "AWS": "arn:aws:iam::${var.master_account}:root"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "StandardAdminAccess_role_policy_attach" {
  role       = aws_iam_role.StandardAdminAccess_role.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_role" "FullReadOnlyAccess_role" {
  name                 = "${var.role_prefix}FullReadOnlyAccess"
  max_session_duration = 7200
  path                 = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "AWS": "arn:aws:iam::${var.master_account}:root"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "FullReadOnlyAccess_role_policy_attach" {
  role       = aws_iam_role.FullReadOnlyAccess_role.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role" "SecurityAnalyst_role" {
  name                 = "${var.role_prefix}SecurityAnalyst"
  max_session_duration = 7200
  path                 = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "AWS": "arn:aws:iam::${var.master_account}:root"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "SecurityAnalyst_role_policy_attach" {
  role       = aws_iam_role.SecurityAnalyst_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
