class Cart
  attr_reader :items

  def initialize
    @items = []
  end


  def add_dish(dish)
    current_item = @items.find {|item| item.dish == dish}
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(dish)
    end
  end

  def total_price
    @items.sum { |item| item.price }
  end


end