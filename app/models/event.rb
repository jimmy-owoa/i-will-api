class Event < ApplicationRecord
  belongs_to :commune
  belongs_to :group
end
