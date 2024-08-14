class Cafe < ApplicationRecord
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["address", "name", "description"]
  end

end
