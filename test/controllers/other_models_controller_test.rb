require "test_helper"

class OtherModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_model = other_models(:one)
  end

  test "should get index" do
    get other_models_url
    assert_response :success
  end

  test "should get new" do
    get new_other_model_url
    assert_response :success
  end

  test "should create other_model" do
    assert_difference('OtherModel.count') do
      post other_models_url, params: { other_model: { name: @other_model.name } }
    end

    assert_redirected_to other_model_url(OtherModel.last)
  end

  test "should show other_model" do
    get other_model_url(@other_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_model_url(@other_model)
    assert_response :success
  end

  test "should update other_model" do
    patch other_model_url(@other_model), params: { other_model: { name: @other_model.name } }
    assert_redirected_to other_model_url(@other_model)
  end

  test "should destroy other_model" do
    assert_difference('OtherModel.count', -1) do
      delete other_model_url(@other_model)
    end

    assert_redirected_to other_models_url
  end
end
