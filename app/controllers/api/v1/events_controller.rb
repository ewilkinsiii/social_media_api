module Api
  module V1
    class EventsController < ApplicationController
      require 'net/http'
      require 'json'
      include Api::Concerns::GithubRequest

      def github
        # Create the HTTP request
        uri = request_url(params[:username])

        request = build_request(uri, params[:token])

        # Make the HTTP request
        response = make_request(request, uri)

        # Check if the response is successful (HTTP 200 OK)
        if response.is_a?(Net::HTTPSuccess)
          # Parse the JSON response
          data = JSON.parse(response.body)

          # Now 'data' contains the GitHub public events data
          render json: data
        else
          # Handle the case when the request was not successful
          render json: { error: 'Failed to fetch data from GitHub' }, status: :internal_server_error
        end
      end
    end
  end
end
