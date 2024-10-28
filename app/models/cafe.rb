class Cafe < ApplicationRecord
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.ransackable_attributes(auth_object = nil)
    ["address", "name", "description"]
  end

  has_many :reviews, dependent: :destroy

end
