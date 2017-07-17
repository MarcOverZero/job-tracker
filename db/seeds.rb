Company.destroy_all
Job.destroy_all
# Category.destroy_all

COMPANIES = ["AT&T", "SpaceX", "GM", "GoSpotCheck", "Amazon", "omg srsly just work here", "Enernoc", "Mrs. Wiggle's Fresh Baked Data Analytics"]
JOBS = ["CEO", "CFO", "Junior Engineer", "Manager", "Dog Walker", "Quality Assurance Manager", "Data Scientist", "Cook"]
CITIES = ["Denver", "Boston", "New York City", "Colorado Springs", "Boulder", "Los Angeles", "San Diego", "Austin", "Portland", "Park City", "Asheville", "Oakland"]
# CATEGORIES = ["IT", "Marketing", "Admin", "HR", "Support"]


COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "Step your career up today!", level_of_interest: num + rand(100), city: CITIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end
