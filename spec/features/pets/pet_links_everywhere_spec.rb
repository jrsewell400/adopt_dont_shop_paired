require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can click all pets" do
    shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")



    lilly = Pet.create(image: "pets/golden.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}/pets"
    click_on lilly.name
    have_current_path "/pets/#{lilly.id}"
  end
end

# User Story 18, Pet Links
#
# As a visitor
# When I click on the name a pet anywhere on the site
# Then that link takes me to that Pet's show page
