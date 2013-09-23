# receive_and_record_inventory_spec.rb

require 'spec_helper'

feature "receive and record inventory", %q{
  As a food service employee
  I want to receive inventory
  So that it can be recorded that we have food items
} do

  # Acceptance Criteria:
  #
  # * I must specify a title, description, and quantity of the food item
  # * If I do not specify the required information, I am prompted to
  #   fix errors and to resubmit
  # * If I specity the required information, my inventory entry is recorded

  scenario "user enters information correctly" do
    visit new_item_path

    fill_in "Title", with: "Oreos"
    fill_in "Description", with: "A cookie that is only good when you have
      some form of milk to dunk it in."
    fill_in "Quantity", with: 100
    click_on "Submit"

    expect(page).to have_content("Item recorded successfully")
  end

  scenario "user leaves out information" do
    visit new_item_path
    click_on "Submit"
    expect(page).to have_content("can't be blank")
  end
end
