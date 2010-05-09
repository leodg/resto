require 'test_helper'

class IngredientCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => IngredientCategory.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    IngredientCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    IngredientCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ingredient_category_url(assigns(:ingredient_category))
  end
  
  def test_edit
    get :edit, :id => IngredientCategory.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    IngredientCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => IngredientCategory.first
    assert_template 'edit'
  end
  
  def test_update_valid
    IngredientCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => IngredientCategory.first
    assert_redirected_to ingredient_category_url(assigns(:ingredient_category))
  end
  
  def test_destroy
    ingredient_category = IngredientCategory.first
    delete :destroy, :id => ingredient_category
    assert_redirected_to ingredient_categories_url
    assert !IngredientCategory.exists?(ingredient_category.id)
  end
end
