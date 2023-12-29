class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :posts
  has_one_attached :avatar do |attachable|
    attachable.variant :base, resize_to_limit: [200, 200]
  end
  
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}, format: { with: VALID_EMAIL }

  has_secure_password
end