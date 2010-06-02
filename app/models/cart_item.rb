class CartItem

  attr_reader :dish, :quantity

  def initialize(dish)
    @dish= dish
    @quantity = 1
  end

  def increment_quantity
    @quantity += 1
  end

  def name
    @dish.name
  end
 

  def price
    @dish.price * @quantity
  end
end