require 'rails_helper'

RSpec.describe '/api/v1/user_ratings', type: :request do
  scenario 'GET /api/v1/user_ratings' do
    user_ratings = create_list(:user_rating, 10)

    get '/api/v1/user_ratings'
    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]
    expect(data.size).to eq(10)
  end

  scenario 'GET /api/v1/user_ratings/:id' do
    user_rating = create(:user_rating)

    get "/api/v1/user_ratings/#{user_rating.id}"
    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]

    user_relationship = data[:relationships][:user][:data]
    user_id_from_data = user_relationship[:id].to_i

    expect(data[:id]).to eq(user_rating.id.to_s)
    expect(data[:attributes][:rating]).to eq(user_rating.rating)
    expect(user_id_from_data).to eq(user_rating.user_id)
  end

  scenario 'POST /api/v1/user_ratings' do
    user_rating_attributes = attributes_for(:user_rating)

    post '/api/v1/user_ratings', params: { user_rating: user_rating_attributes }.to_json,
                                 headers: { 'Content-Type' => 'application/json' }

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]

    user_relationship = data[:relationships][:user][:data]
    user_id_from_data = user_relationship[:id].to_i

    expect(data[:id]).to be_present
    expect(data[:attributes][:rating]).to eq(user_rating_attributes[:rating])
    expect(user_id_from_data).to eq(user_rating_attributes[:user_id])
  end

  scenario 'PATCH /api/v1/user_ratings/:id' do
    user_rating = create(:user_rating)
    new_rating = 5

    patch "/api/v1/user_ratings/#{user_rating.id}", params: { user_rating: { rating: new_rating } }.to_json,
                                                    headers: { 'Content-Type' => 'application/json' }
    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]

    user_relationship = data[:relationships][:user][:data]
    user_id_from_data = user_relationship[:id].to_i

    expect(data[:id]).to eq(user_rating.id.to_s)
    expect(data[:attributes][:rating]).to eq(new_rating)
    expect(user_id_from_data).to eq(user_rating.user_id)
  end
end
