require 'test_helper'

class DishTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Dish.new.valid?
  end
end
