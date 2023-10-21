require 'rails_helper'

RSpec.describe UserRating, type: :model do
  before(:all) do
    @user_rating = create(:user_rating)
  end

  it 'is valid with valid attributes' do
    expect(@user_rating).to be_valid
  end

  it 'is not valid without a rating' do
    user_rating2 = build(:user_rating, rating: nil)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid without a user' do
    user_rating2 = build(:user_rating, user: nil)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid when user self rating' do
    @user = create(:user)
    user_rating2 = build(:user_rating, user: @user, rater_id: @user.id)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid without a user_id' do
    user_rating2 = build(:user_rating, user_id: nil)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid with a user_id that does not exist' do
    user_rating2 = build(:user_rating, user_id: 100)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid with a user_id that is not an integer' do
    user_rating2 = build(:user_rating, user_id: 'a')
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid with a rating that is not an integer' do
    user_rating2 = build(:user_rating, rating: 'a')
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid with a rating that is less than 1' do
    user_rating2 = build(:user_rating, rating: 0)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid with a rating that is greater than 5' do
    user_rating2 = build(:user_rating, rating: 6)
    expect(user_rating2).to_not be_valid
  end

  it 'is not valid with a rating that is not an integer' do
    user_rating2 = build(:user_rating, rating: 'a')
    expect(user_rating2).to_not be_valid
  end
end
