module Api
  module V1
    class EventsController < ApplicationController
      require 'net/http'
      require 'json'
      include Api::Concerns::GithubRequest

      def github
        uri = request_url(params[:username])
        request = build_request(uri, params[:token])
        response = make_request(request, uri)

        if response.is_a?(Net::HTTPSuccess)
          data = JSON.parse(response.body)

          render json: data
        else
          render json: { error: 'Failed to fetch data from GitHub' }, status: :internal_server_error
        end
      end
    end
  end
end
