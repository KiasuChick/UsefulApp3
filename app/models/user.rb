require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

attr_accessible :name, :email, :password, :password_digest 

validates_presence_of :email, :password

  # def password
  #   @password
  # end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  # def password=(new_password)
  #   @password = new_password
  #   self.password_digest = BCrypt::Password.create(new_password)
  # end


  def authenticate(login_password)
    if BCrypt::Password.new(self.password_digest) == login_password
    self
  else
    false
  end
  end
end





