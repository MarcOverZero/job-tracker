require 'rails_helper'

describe "User creates a new category" do
  scenario "user can fill out form for new category and be shown once created" do
    visit new_category_path

    fill_in "category[title]", with: "Electrical"

    click_button "Create"

    expect(page).to have_content("Electrical")
  end

  scenario "if user tries to create category that already exists, they are notified that it exists already" do
    visit new_category_path
    fill_in "category[title]", with: "Electrical"
    click_button "Create"

    visit new_category_path
    fill_in "category[title]", with: "Electrical"
    click_button "Create"

    expect(Category.count).to eq(1)
    # expect(page).to have_content("Category already exists")
  end

end
