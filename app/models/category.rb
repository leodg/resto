class Category < ActiveRecord::Base
  attr_accessible :parent_id, :name
end
