require "application_system_test_case"

class OtherModelsTest < ApplicationSystemTestCase
  setup do
    @other_model = other_models(:one)
  end

  test "visiting the index" do
    visit other_models_url
    assert_selector "h1", text: "Other Models"
  end

  test "creating a Other model" do
    visit other_models_url
    click_on "New Other Model"

    fill_in "Name", with: @other_model.name
    click_on "Create Other model"

    assert_text "Other model was successfully created"
    click_on "Back"
  end

  test "updating a Other model" do
    visit other_models_url
    click_on "Edit", match: :first

    fill_in "Name", with: @other_model.name
    click_on "Update Other model"

    assert_text "Other model was successfully updated"
    click_on "Back"
  end

  test "destroying a Other model" do
    visit other_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Other model was successfully destroyed"
  end
end
