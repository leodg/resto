class Cart
  attr_reader :items

  def initialize
    @items = []
  end


  def add_dish(dish)
    current_item = @items.find {|item| item.dish == dish} # Есть ли блюдо уже в заказе
    if current_item
      current_item.increment_quantity # Увеличиваем кол-во в заказе
    else
      @items << CartItem.new(dish) # Добавляем в заказ
    end
  end

  def total_price
    @items.sum { |item| item.price }
  end


end