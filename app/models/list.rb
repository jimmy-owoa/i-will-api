class List < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user
  has_many :tasks

  def self.as_list_json
    lists = self.all
    
    data = []
    lists.each do |list|
      data << {
        id: list.id,
        slug: list.slug,
        name: list.name,
        description: list.description,
        code: list.code,
        start_date: I18n.l(list.start_date, format: "%d-%m-%Y %H:%M"),
        end_date: I18n.l(list.end_date, format: "%d-%m-%Y %H:%M")
      }
    end

    data
  end
end