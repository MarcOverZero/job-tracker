require 'rails_helper'

describe "User creates comments" do
  scenario "for a specific job" do
    category = Category.create!(title: "Executive Management")
    company = Company.create!(name: "NFL")
    job     = company.jobs.create!(title: "VP", level_of_interest: 78, city: "NYC", category_id: category.id )

    visit companies_path
    click_on "NFL"
    click_on "VP"
    fill_in "comment[notes]", with: "Awesome interview"
    click_button "Create"

    expect(page).to have_content("Awesome interview")
    expect(page).to have_content("less than a minute ago")
  end

end
