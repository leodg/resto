require 'test_helper'

class IngredientCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert IngredientCategory.new.valid?
  end
end
