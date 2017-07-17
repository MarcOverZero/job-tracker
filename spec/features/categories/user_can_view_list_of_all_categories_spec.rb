require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "Electrical")
    category_2 = Category.create!(title: "Marketing")

    visit categories_path

    expect(page).to have_content("Electrical")
    expect(page).to have_content("Marketing")
  end

end
