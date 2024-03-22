output "web_urls_endpoint" {
  value       = aws_api_gateway_stage.web_urls.invoke_url
  description = "Gateway endpoint to call APIs"
}
