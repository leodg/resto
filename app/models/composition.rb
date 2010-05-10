class Composition < ActiveRecord::Base
  attr_accessible :ingredient_id, :quantity, :ingredient_name
  belongs_to :dish
  belongs_to :ingredient

  def ingredient_name
    return ingredient.name if ingredient
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end
end
