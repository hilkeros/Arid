class User < ActiveRecord::Base
  acts_as_authentic
  login_field :email
  
  has_many :comments
end
