class User < ApplicationRecord
  after_save :assign_default_role
  rolify
  has_secure_password

  has_many :users
  has_many :lists
  has_many :members
  has_many :groups, through: :members
  
  has_and_belongs_to_many :tasks

  validates :email, uniqueness: { case_sensitive: false }
  validates :legal_number, uniqueness: { case_sensitive: false }

  def self.handle_login(legal_number, password)
    user = User.find_by(legal_number: legal_number)
    if user && user.authenticate(password)
      user_info = Hash.new
      user_info[:auth_token] = JsonWebToken.encode({user_id: user.id}, 24.hours.from_now)
      user_info[:user_id] = user.id
      user_info[:name] = user.name.capitalize
      return user_info
    else
      return false
    end
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end