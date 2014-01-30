require 'test_helper'

class MedicationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Medication.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Medication.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Medication.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to medication_url(assigns(:medication))
  end

  def test_edit
    get :edit, :id => Medication.first
    assert_template 'edit'
  end

  def test_update_invalid
    Medication.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Medication.first
    assert_template 'edit'
  end

  def test_update_valid
    Medication.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Medication.first
    assert_redirected_to medication_url(assigns(:medication))
  end

  def test_destroy
    medication = Medication.first
    delete :destroy, :id => medication
    assert_redirected_to medications_url
    assert !Medication.exists?(medication.id)
  end
end
