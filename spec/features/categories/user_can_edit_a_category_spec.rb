require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Legal")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Accounting"
    click_button "Update"

    expect(page).to have_content("Accounting")
    expect(page).to_not have_content("Legal")
  end

end
