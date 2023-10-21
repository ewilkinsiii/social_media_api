require 'rails_helper'

RSpec.describe '/api/v1/posts/1/comments', type: :request do
  before(:each) do
    @post = create(:post)
  end

  scenario 'GET /api/v1/posts/1/comments' do
    comments = create_list(:comment, 10, post_id: @post.id)
    get "/api/v1/posts/#{@post.id}/comments"
    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]
    expect(data.size).to eq(10)
  end

  scenario 'GET /api/v1/posts/1/comments/:id' do
    comment = create(:comment, post_id: @post.id)
    get "/api/v1/posts/#{@post.id}/comments/#{comment.id}"
    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]
    expect(data[:id]).to eq(comment.id.to_s)
    expect(data[:attributes][:message]).to eq(comment.message)
  end

  scenario 'POST /api/v1/posts/1/comments' do
    comment_attributes = attributes_for(:comment, post_id: @post.id)
    post "/api/v1/posts/#{@post.id}/comments", params: { comment: comment_attributes }.to_json,
                                               headers: { 'Content-Type' => 'application/json' }
    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]
    expect(data[:id]).to be_present
    expect(data[:attributes][:message]).to eq(comment_attributes[:message])
  end

  scenario 'PUT /api/v1/posts/1/comments/:id' do
    comment = create(:comment, post_id: @post.id)
    comment_attributes = attributes_for(:comment)
    put "/api/v1/posts/#{@post.id}/comments/#{comment.id}", params: { comment: comment_attributes }.to_json,
                                                            headers: { 'Content-Type' => 'application/json' }
    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body).deep_symbolize_keys
    data = json[:data]
    expect(data[:id]).to eq(comment.id.to_s)
    expect(data[:attributes][:body]).to eq(comment_attributes[:body])
  end

  scenario 'DELETE /api/v1/posts/1/comments/:id' do
    comment = create(:comment, post_id: @post.id)
    delete "/api/v1/posts/#{@post.id}/comments/#{comment.id}"
    expect(response).to have_http_status(:no_content)
  end
end
