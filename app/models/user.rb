class User < ActiveRecord::Base
  #attr_accessible :name, :password
  acts_as_authentic
  login_field :name
end
