class Group < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image
  has_many :members
  has_many :users, through: :members
  
  belongs_to :commune
  has_many :events

  def self.all_as_json
    groups = self.all
    data = []
    groups.each do |group|
      data << {
        id: group.id,
        name: group.name,
        description: group.get_limited_description,
        slug: group.slug,
        image: group.get_image_url(),
        address: group.address,
        members: group.members.count,
      }
    end

    data
  end

  def one_as_json
    data = {
      id: self.id, 
      name: self.name,
      description: self.description,
      slug: self.slug,
      image: self.get_image_url(),
      address: self.address,
      members: self.members.count,
    }
    data
  end

  def get_image_url
    self.image.attached? ? url_for(self.image) : nil
  end

  def get_limited_description
    self.description.first(250) + "..."
  end
end
