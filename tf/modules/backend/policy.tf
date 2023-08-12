data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }

}

data "aws_iam_policy_document" "policy_for_lambda" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]
    resources = ["${aws_dynamodb_table.basic-dynamodb-table.arn}"]
  }
}

resource "aws_iam_policy" "iam_lambda_dynamodb_policy" {
  name        = "LambdaDynamoDB"
  description = "Lambda Policy"
  policy      = data.aws_iam_policy_document.policy_for_lambda.json
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "LambdaDynamoDB"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.iam_lambda_dynamodb_policy.arn
}
