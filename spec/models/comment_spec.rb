require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment = create(:comment)
  end

  it 'is valid with valid attributes' do
    expect(@comment).to be_valid
  end

  it 'is not valid without a message' do
    comment2 = build(:comment, message: nil)
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a message less than 5 characters' do
    comment2 = build(:comment, message: '1234')
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a message more than 1000 characters' do
    comment2 = build(:comment, message: 'a' * 1001)
    expect(comment2).to_not be_valid
  end

  it 'is not valid without a user' do
    comment2 = build(:comment, user: nil)
    expect(comment2).to_not be_valid
  end

  it 'is not valid without a post' do
    comment2 = build(:comment, post: nil)
    expect(comment2).to_not be_valid
  end

  it 'is not valid without a user_id' do
    comment2 = build(:comment, user_id: nil)
    expect(comment2).to_not be_valid
  end

  it 'is not valid without a post_id' do
    comment2 = build(:comment, post_id: nil)
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a user_id that does not exist' do
    comment2 = build(:comment, user_id: 100)
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a post_id that does not exist' do
    comment2 = build(:comment, post_id: 100)
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a user_id that is not an integer' do
    comment2 = build(:comment, user_id: 'a')
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a post_id that is not an integer' do
    comment2 = build(:comment, post_id: 'a')
    expect(comment2).to_not be_valid
  end

  it 'is not valid with a message that is not a string' do
    comment2 = build(:comment, message: 1)
    expect(comment2).to_not be_valid
  end
end
