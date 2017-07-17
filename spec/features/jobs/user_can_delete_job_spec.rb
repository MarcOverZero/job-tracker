require 'rails_helper'

describe "User can delete an existing job" do
  scenario "they can remove job" do
    company = Company.create!(name: "Warner Brothers")
    category = Category.create!(title: "Electrical")
    job     = company.jobs.create!(title: "Porky Pig Actor", level_of_interest: 56, category_id: category.id, city: "Los Angeles")

    visit company_job_path(company, job)
    click_link("Delete")

    expect(page).to_not have_content("Porky Pig Actor")
    expect(page).to have_content("Warner Brothers")
  end

end
