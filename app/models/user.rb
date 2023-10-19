# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_ratings, dependent: :destroy
  has_many :rater, through: :user_ratings, dependent: :destroy, source: :user
end
