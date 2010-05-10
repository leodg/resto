require 'test_helper'

class CompositionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Composition.new.valid?
  end
end
