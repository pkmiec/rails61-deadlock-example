require "application_system_test_case"

class PrimaryModelsTest < ApplicationSystemTestCase
  setup do
    @primary_model = primary_models(:one)
  end

  test "visiting the index" do
    visit primary_models_url
    assert_selector "h1", text: "Primary Models"
  end

  test "creating a Primary model" do
    visit primary_models_url
    click_on "New Primary Model"

    fill_in "Name", with: @primary_model.name
    click_on "Create Primary model"

    assert_text "Primary model was successfully created"
    click_on "Back"
  end

  test "updating a Primary model" do
    visit primary_models_url
    click_on "Edit", match: :first

    fill_in "Name", with: @primary_model.name
    click_on "Update Primary model"

    assert_text "Primary model was successfully updated"
    click_on "Back"
  end

  test "destroying a Primary model" do
    visit primary_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Primary model was successfully destroyed"
  end
end
