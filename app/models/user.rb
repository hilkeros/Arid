class User < ActiveRecord::Base
  acts_as_authentic
  login_field :email
end
