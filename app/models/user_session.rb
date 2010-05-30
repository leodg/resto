class UserSession < Authlogic::Session::Base
  login_field :name
  password_field :password
end