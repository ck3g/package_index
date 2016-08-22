require 'rails_helper'

feature "Package details page" do
  given!(:package) do
    create :package,
      name: "A3",
      version: "1.0.0",
      published_at: DateTime.parse("2015-08-16 23:05:52"),
      title: "AAA Title",
      description: "AAA Description",
      authors: "Scott Fortmann-Roe",
      maintainers: "Scott Fortmann-Roe <scottfr@berkeley.edu>"
  end

  scenario "user can navigate to the package details page" do
    visit root_path

    within "#package_#{package.id}" do
      click_link "Details"
    end

    expect(current_path).to eq package_path(package)
    expect(page).to have_content "Package Name: A3"
    expect(page).to have_content "Version: 1.0.0"
    expect(page).to have_content "Date/Publication: 2015-08-16 23:05:52"
    expect(page).to have_content "Title: AAA Title"
    expect(page).to have_content "Description: AAA Description"
    expect(page).to have_content "Scott Fortmann-Roe"
    expect(page).to have_content "Scott Fortmann-Roe <scottfr@berkeley.edu>"
  end
end
