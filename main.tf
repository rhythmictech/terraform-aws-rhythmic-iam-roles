data "aws_iam_policy_document" "assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.master_account}:root"]
    }

    dynamic "condition" {
      for_each = var.external_id != "" ? [1] : []
      content {
        test     = "StringEquals"
        variable = "sts:ExternalId"
        values = [
          var.external_id
        ]
      }
    }
  }
}

resource "aws_iam_role" "FullAdminAccess" {
  name                 = "${var.role_prefix}FullAdminAccess"
  assume_role_policy   = data.aws_iam_policy_document.assume.json
  max_session_duration = var.max_session_duration
  path                 = "/"
  tags = merge(
    var.tags,
    { Name = "${var.role_prefix}FullAdminAccess" }
  )
}

resource "aws_iam_role_policy_attachment" "FullAdminAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.FullAdminAccess.name
}

resource "aws_iam_role" "StandardAdminAccess" {
  count                = var.create_standard_admin_role ? 1 : 0
  name                 = "${var.role_prefix}${var.standard_admin_role_name}"
  assume_role_policy   = data.aws_iam_policy_document.assume.json
  max_session_duration = var.max_session_duration
  path                 = "/"
  tags = merge(
    var.tags,
    { Name = "${var.role_prefix}${var.standard_admin_role_name}" }
  )
}

resource "aws_iam_role_policy_attachment" "StandardAdminAccess" {
  count      = var.create_standard_admin_role && var.standard_admin_attach_poweruser ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  role       = aws_iam_role.StandardAdminAccess[0].name
}

locals {
  standard_admin_additional_policies_length = var.create_standard_admin_role ? 0 : length(var.standard_admin_additional_policies)
}

resource "aws_iam_role_policy_attachment" "StandardAdmin_additional_policies" {
  count      = local.standard_admin_additional_policies_length
  policy_arn = var.standard_admin_additional_policies[count.index]
  role       = aws_iam_role.StandardAdminAccess[0].name
}

resource "aws_iam_role" "FullReadOnlyAccess" {
  name                 = "${var.role_prefix}FullReadOnlyAccess"
  assume_role_policy   = data.aws_iam_policy_document.assume.json
  max_session_duration = var.max_session_duration
  path                 = "/"
  tags = merge(
    var.tags,
    { Name = "${var.role_prefix}FullReadOnlyAccess" }
  )
}

resource "aws_iam_role_policy_attachment" "FullReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = aws_iam_role.FullReadOnlyAccess.name
}

resource "aws_iam_role" "SecurityAnalyst" {
  count                = var.create_security_analyst_role ? 1 : 0
  name                 = "${var.role_prefix}SecurityAnalyst"
  assume_role_policy   = data.aws_iam_policy_document.assume.json
  max_session_duration = var.max_session_duration
  path                 = "/"
  tags = merge(
    var.tags,
    { Name = "${var.role_prefix}SecurityAnalyst" }
  )
}

resource "aws_iam_role_policy_attachment" "SecurityAnalyst" {
  count      = var.create_security_analyst_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.SecurityAnalyst[0].name
}
