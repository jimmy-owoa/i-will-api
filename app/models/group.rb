class Group < ApplicationRecord
  has_one_attached :image
  has_many :members
  has_many :users, through: :members
  
  belongs_to :commune
  has_many :events
end
