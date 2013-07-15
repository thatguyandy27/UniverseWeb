require 'test_helper'

class EntitySubtypesControllerTest < ActionController::TestCase
  setup do
    @entity_subtype = entity_subtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entity_subtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entity_subtype" do
    assert_difference('EntitySubtype.count') do
      post :create, entity_subtype: { name: @entity_subtype.name }
    end

    assert_redirected_to entity_subtype_path(assigns(:entity_subtype))
  end

  test "should show entity_subtype" do
    get :show, id: @entity_subtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entity_subtype
    assert_response :success
  end

  test "should update entity_subtype" do
    put :update, id: @entity_subtype, entity_subtype: { name: @entity_subtype.name }
    assert_redirected_to entity_subtype_path(assigns(:entity_subtype))
  end

  test "should destroy entity_subtype" do
    assert_difference('EntitySubtype.count', -1) do
      delete :destroy, id: @entity_subtype
    end

    assert_redirected_to entity_subtypes_path
  end
end
