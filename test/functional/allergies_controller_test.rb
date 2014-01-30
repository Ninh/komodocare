require 'test_helper'

class AllergiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Allergy.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Allergy.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Allergy.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to allergy_url(assigns(:allergy))
  end

  def test_edit
    get :edit, :id => Allergy.first
    assert_template 'edit'
  end

  def test_update_invalid
    Allergy.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Allergy.first
    assert_template 'edit'
  end

  def test_update_valid
    Allergy.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Allergy.first
    assert_redirected_to allergy_url(assigns(:allergy))
  end

  def test_destroy
    allergy = Allergy.first
    delete :destroy, :id => allergy
    assert_redirected_to allergies_url
    assert !Allergy.exists?(allergy.id)
  end
end
