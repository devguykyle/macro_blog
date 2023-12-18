class Post < ApplicationRecord
  validates :title, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 500 }
end