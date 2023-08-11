output "api_url" {
  description = "Base URL for API Gateway stage."
  value       = "${aws_api_gateway_stage.lambda.invoke_url}/${aws_api_gateway_resource.lambda.path_part}"
}

output "api_key" {
  description = "API Key for visitor counting"
  value       = aws_api_gateway_api_key.lambda.value
  sensitive   = true
}
