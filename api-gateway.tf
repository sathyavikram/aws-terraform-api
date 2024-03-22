
data "template_file" "openapi_template" {
  template = templatefile("${path.module}/openapi.json", {})
}

resource "aws_api_gateway_rest_api" "web_urls" {
  name = "WebUrls"
  body = data.template_file.openapi_template.rendered
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "web_urls" {
  rest_api_id = aws_api_gateway_rest_api.web_urls.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.web_urls.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "web_urls" {
  deployment_id = aws_api_gateway_deployment.web_urls.id
  rest_api_id   = aws_api_gateway_rest_api.web_urls.id
  stage_name    = "dev"
}
