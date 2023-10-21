require 'rails_helper'

RSpec.describe Api::V1::UserRatingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/user_ratings').to route_to('api/v1/user_ratings#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/user_ratings/1').to route_to('api/v1/user_ratings#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/user_ratings').to route_to('api/v1/user_ratings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/user_ratings/1').to route_to('api/v1/user_ratings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/user_ratings/1').to route_to('api/v1/user_ratings#update', id: '1')
    end
  end
end
