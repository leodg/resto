require 'test_helper'

class DishesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Dish.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Dish.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Dish.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to dish_url(assigns(:dish))
  end
  
  def test_edit
    get :edit, :id => Dish.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Dish.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Dish.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Dish.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Dish.first
    assert_redirected_to dish_url(assigns(:dish))
  end
  
  def test_destroy
    dish = Dish.first
    delete :destroy, :id => dish
    assert_redirected_to dishes_url
    assert !Dish.exists?(dish.id)
  end
end
