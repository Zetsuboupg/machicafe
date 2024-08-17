class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :cafe
  belongs_to :user
end
