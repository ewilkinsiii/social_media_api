# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_ratings, dependent: :destroy
  has_many :rater, through: :user_ratings, dependent: :destroy, source: :user
  has_many :user_timelines

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.avatar = auth.raw_info.avatar_url
      user.password = Devise.friendly_token[0, 20]
      user.uid = auth.uid
      user.provider = auth.provider
      user.save!
    end
  end
end
