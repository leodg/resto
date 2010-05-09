class Dish < ActiveRecord::Base
  attr_accessible :category_id, :name, :desc, :price, :available
end
