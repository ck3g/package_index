require 'rails_helper'

feature "Packages List" do
  given!(:package_abc) { create :package, name: "abc", version: "1.0.0" }
  given!(:package_xyz) { create :package, name: "xyz", version: "0.0.1" }

  scenario "user can see links to the packages on the page" do
    visit root_url

    expect(page).to have_selector "a", text: "abc 1.0.0"
    expect(page).to have_selector "a", text: "xyz 0.0.1"
  end
end
