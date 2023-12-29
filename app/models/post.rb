class Post < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user, presence: true
end