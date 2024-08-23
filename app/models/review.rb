class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :cafe
  belongs_to :user
  has_many :review_tags, dependent: :destroy
  has_many :tags, through: :review_tags
end
