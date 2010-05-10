class Category < ActiveRecord::Base
  attr_accessible :parent_id, :name
  acts_as_tree
end
