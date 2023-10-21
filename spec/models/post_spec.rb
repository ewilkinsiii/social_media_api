require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @post = create(:post)
  end

  it 'is valid with valid attributes' do
    expect(@post).to be_valid
  end

  it 'is not valid without a title' do
    post2 = build(:post, title: nil)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a title less than 5 characters' do
    post2 = build(:post, title: '1234')
    expect(post2).to_not be_valid
  end

  it 'is not valid without a body' do
    post2 = build(:post, body: nil)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a body less than 5 characters' do
    post2 = build(:post, body: '1234')
    expect(post2).to_not be_valid
  end

  it 'is not valid with a body more than 1000 characters' do
    post2 = build(:post, body: 'a' * 1001)
    expect(post2).to_not be_valid
  end

  it 'is not valid without a user' do
    post2 = build(:post, user: nil)
    expect(post2).to_not be_valid
  end

  it 'is not valid without a user_id' do
    post2 = build(:post, user_id: nil)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a user_id that does not exist' do
    post2 = build(:post, user_id: 100)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a user_id that is not an integer' do
    post2 = build(:post, user_id: 'a')
    expect(post2).to_not be_valid
  end
end
