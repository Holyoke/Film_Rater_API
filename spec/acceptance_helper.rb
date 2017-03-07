RspecApiDocumentation.configure do |config|
  config.api_name = "Film Rater API" # Your API name
  config.curl_host = "localhost:3000"
  config.request_headers_to_include = ['Accept', 'Content-Type']
  config.response_headers_to_include = []
  config.curl_headers_to_filter = ['Host', 'Cookie'] # Remove this if you want to show Auth headers in request
  config.keep_source_order = true
end
