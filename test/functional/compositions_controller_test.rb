require 'test_helper'

class CompositionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Composition.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Composition.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Composition.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to composition_url(assigns(:composition))
  end
  
  def test_edit
    get :edit, :id => Composition.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Composition.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Composition.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Composition.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Composition.first
    assert_redirected_to composition_url(assigns(:composition))
  end
  
  def test_destroy
    composition = Composition.first
    delete :destroy, :id => composition
    assert_redirected_to compositions_url
    assert !Composition.exists?(composition.id)
  end
end
