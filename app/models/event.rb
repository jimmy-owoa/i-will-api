class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :commune
  belongs_to :group
end
