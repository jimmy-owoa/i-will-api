class User < ApplicationRecord
  has_secure_password
  
  has_many :users
  has_many :lists
  has_and_belongs_to_many :tasks
end
