class StoreController < ApplicationController
  layout "store"
  def index
    @dishes = Dish.find_for_sale
    @cart = find_cart
    @categories = Category.find_no_parent
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dishes }
    end
  end

  def add_to_cart
    dish = Dish.find(params[:id])
    @cart = find_cart
    @cart.add_dish(dish)
    respond_to do |format|
      format.js
    end
  end

  def empty_cart
    session[:cart] = nil
    flash[:notice] = "Заказ отменен"
    redirect_to :action => 'index'
  end

  private
  def find_cart
    session[:cart] ||= Cart.new
  end


end
