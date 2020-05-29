class Task < ApplicationRecord
  belongs_to :task_type
  belongs_to :measure_unit
  belongs_to :list
  has_and_belongs_to_many :users
end
