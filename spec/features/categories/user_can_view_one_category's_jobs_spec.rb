require 'rails_helper'

describe "When user visits page for specific category" do
  scenario "they can see list of all jobs for that category" do
    company    = Company.create!(name: "HBO")
    category   = Category.create!(title: "Production")
    category_2 = Category.create!(title: "Business Development")
    company.jobs.create!(title: "Assistant Producer", level_of_interest: 67, city: "New York", category_id: category.id)
    company.jobs.create!(title: "VP of Strategy", level_of_interest: 88, city: "London", category_id: category_2.id)

    visit category_path(category)

    expect(page).to have_content("Assistant Producer")
    expect(page).to_not have_content("VP of Strategy")
  end


end
