require 'rails_helper'

RSpec.describe "shelters pets", type: :feature do
  it "can show all pets in a shelter" do
    shelter_1 = Shelter.create(name:       "Maxxxx Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    shelter_2 = Shelter.create(name:       "Shelters Anonymous",
                               address:       "15580 Quorum Dr",
                               city:          "Dallas",
                               state:         "Texas",
                               zip:          "75001"
                               )

    lilly = Pet.create(image: "pets/lab.jpg",
                       name: "Lilly",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id

                        )

    max = Pet.create(image: "pets/lab.jpg",
                       name: "Max",
                       age: "14",
                       sex: "Male",
                       shelter_id: shelter_2.id
                        )


  visit "/shelters/#{shelter_1.id}/pets"
  expect(page).to have_content('Lilly')
  expect(page).to have_content('4')
  expect(page).to have_content('Female')
  # save_and_open_page
  end
end

# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
