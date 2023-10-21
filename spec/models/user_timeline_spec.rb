require 'rails_helper'

RSpec.describe UserTimeline, type: :model do
  before(:all) do
    @user_timeline = create(:user_timeline)
  end

  it 'is valid with valid attributes' do
    expect(@user_timeline).to be_valid
  end

  it 'is not valid without a user' do
    user_timeline2 = build(:user_timeline, user: nil)
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid without a user_id' do
    user_timeline2 = build(:user_timeline, user_id: nil)
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid with a user_id that does not exist' do
    user_timeline2 = build(:user_timeline, user_id: 100)
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid with a user_id that is not an integer' do
    user_timeline2 = build(:user_timeline, user_id: 'a')
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid without an action' do
    user_timeline2 = build(:user_timeline, action: nil)
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid without a description' do
    user_timeline2 = build(:user_timeline, description: nil)
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid with a description less than 5 characters' do
    user_timeline2 = build(:user_timeline, description: '1234')
    expect(user_timeline2).to_not be_valid
  end

  it 'is not valid with a description more than 1000 characters' do
    user_timeline2 = build(:user_timeline, description: 'a' * 1001)
    expect(user_timeline2).to_not be_valid
  end
end
