require 'test_helper'

class CelestialEntitiesControllerTest < ActionController::TestCase
  setup do
    @celestial_entity = celestial_entities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:celestial_entities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create celestial_entity" do
    assert_difference('CelestialEntity.count') do
      post :create, celestial_entity: { description: @celestial_entity.description, mass: @celestial_entity.mass, name: @celestial_entity.name, orbit: @celestial_entity.orbit, rotation: @celestial_entity.rotation }
    end

    assert_redirected_to celestial_entity_path(assigns(:celestial_entity))
  end

  test "should show celestial_entity" do
    get :show, id: @celestial_entity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @celestial_entity
    assert_response :success
  end

  test "should update celestial_entity" do
    put :update, id: @celestial_entity, celestial_entity: { description: @celestial_entity.description, mass: @celestial_entity.mass, name: @celestial_entity.name, orbit: @celestial_entity.orbit, rotation: @celestial_entity.rotation }
    assert_redirected_to celestial_entity_path(assigns(:celestial_entity))
  end

  test "should destroy celestial_entity" do
    assert_difference('CelestialEntity.count', -1) do
      delete :destroy, id: @celestial_entity
    end

    assert_redirected_to celestial_entities_path
  end
end
