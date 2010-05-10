class Ingredient < ActiveRecord::Base
  attr_accessible :name, :category
  belongs_to :compositions
end
