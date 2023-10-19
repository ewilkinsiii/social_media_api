require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_length_of(:message).is_at_least(5).is_at_most(1000) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
  end
end
