require "test_helper"

class PrimaryModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @primary_model = primary_models(:one)
  end

  test "should get index" do
    get primary_models_url
    assert_response :success
  end

  test "should get new" do
    get new_primary_model_url
    assert_response :success
  end

  test "should create primary_model" do
    assert_difference('PrimaryModel.count') do
      post primary_models_url, params: { primary_model: { name: @primary_model.name } }
    end

    assert_redirected_to primary_model_url(PrimaryModel.last)
  end

  test "should show primary_model" do
    get primary_model_url(@primary_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_primary_model_url(@primary_model)
    assert_response :success
  end

  test "should update primary_model" do
    patch primary_model_url(@primary_model), params: { primary_model: { name: @primary_model.name } }
    assert_redirected_to primary_model_url(@primary_model)
  end

  test "should destroy primary_model" do
    assert_difference('PrimaryModel.count', -1) do
      delete primary_model_url(@primary_model)
    end

    assert_redirected_to primary_models_url
  end
end
