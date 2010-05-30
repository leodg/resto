require 'test_helper'

class WelcomesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Welcome.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Welcome.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Welcome.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to welcome_url(assigns(:welcome))
  end
  
  def test_edit
    get :edit, :id => Welcome.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Welcome.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Welcome.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Welcome.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Welcome.first
    assert_redirected_to welcome_url(assigns(:welcome))
  end
  
  def test_destroy
    welcome = Welcome.first
    delete :destroy, :id => welcome
    assert_redirected_to welcomes_url
    assert !Welcome.exists?(welcome.id)
  end
end
