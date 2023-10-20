module Api
  module Concerns
    module GithubRequest
      extend ActiveSupport::Concern

      def request_url(username)
        github_api_url = "https://api.github.com/users/#{username}/events/public"

        URI(github_api_url)
      end

      def build_request(uri, token = nil)
        # URL of the GitHub public events API

        # Create an HTTP request
        request = Net::HTTP::Get.new(uri)
        request['Accept'] = 'application/vnd.github+json'
        request['Authorization'] = "Bearer #{token}" if token.present?
        request['X-GitHub-Api-Version'] = '2022-11-28'
        request
      end

      def make_request(request, uri)
        # Make the HTTP request
        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(request)
        end
      end
    end
  end
end
