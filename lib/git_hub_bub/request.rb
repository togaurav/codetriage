module GitHubBub
  class Request
    include HTTParty
    base_uri 'https://api.github.com'
    headers  'Accept' => 'application/vnd.github.3.raw+json'

    def self.fetch(url, input_options = {})
      options = {}
      options[:query] = input_options
      response    = self.get(url, options)
      GitHubBub::Response.create(response)
    end
  end
end
