resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name      = "WebsiteLinks"
  hash_key  = "UserId"
  range_key = "LinkId"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "LinkId"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}