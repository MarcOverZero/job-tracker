require 'rails_helper'

describe "User can update an existing job" do
  scenario "they can edit attributes" do
    company = Company.create!(name: "Walt Disney")
    category = Category.create!(title: "Electrical")
    job     = company.jobs.create!(title: "Donald Duck Actor", level_of_interest: 86, category_id: category.id, city: "Los Angeles")

    visit company_job_path(company, job)
    click_link("Edit")

    new_title = "Goofy Actor"
    fill_in "job_title", with: new_title

    click_button("Update")

    expect(page).to have_content(new_title)
    expect(page).to have_content("Walt Disney")
  end

end
