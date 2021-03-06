class User < ApplicationRecord
  has_secure_password

  has_many :users
  has_many :lists
  has_and_belongs_to_many :tasks

  def self.handle_login(email, password)
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      user_info = Hash.new
      user_info[:auth_token] = JsonWebToken.encode({user_id: user.id}, 4.hours.from_now)
      user_info[:user_id] = user.id
      user_info[:name] = user.name.capitalize
      return user_info
    else
      return false
    end
  end
end
