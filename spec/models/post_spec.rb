require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'attributes' do
    it 'should have title and body attributes' do
      expect(post).to have_attributes(title: post.title, body: post.body)
    end
  end

  describe 'invalid post' do
    it 'should be an invalid post due to blank title' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'should be an invalid post due to blank body' do
      post.body = nil
      expect(post).to_not be_valid
    end
  end

  describe 'scopes' do
    before do
      @post1 = create(:post, created_at: 1.day.ago)
      @post2 = create(:post, created_at: 1.hour.ago)
      @post3 = create(:post)
    end

    describe 'posts_by_created_at' do
      it 'should return posts in the correct order' do
        expect(Post.posts_by_created_at).to eq([@post3, @post2, @post1])
      end
    end
  end
end
