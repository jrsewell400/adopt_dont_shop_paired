require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can click all shelters" do
    shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")

    shelter_2 = Shelter.create(name:       "My Other Shelter",
                         address:       "15580 Quorum Dr",
                         city:          "Dallas",
                         state:         "Texas",
                          zip:          "75001")

    visit "/shelters"
    click_on "Shelters 'r Us"
    have_current_path "/shelters/#{shelter_1.id}"
  end
end


# User Story 17, Shelter Links
#
# As a visitor
# When I click on the name a shelter anywhere on the site
# Then that link takes me to that Shelter's show page
