require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can click all pets" do
    shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")



    lilly = Pet.create!(image: "pets/golden.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id)

    visit "/shelters"
    click_on shelter_1.name
    click_on "Pets"
    click_on lilly.name
    have_current_path "/pets/#{lilly.id}"
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Black Dog')
    expect(page).to have_content('4')
    expect(page).to have_content('Female')
    # expect(page).to have_content('Adoptable')
  end
  it "shows all pets in the database" do
    shelter_1 = Shelter.create(name:       "Maxxxx Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    lilly = Pet.create(image: "pets/lab.jpg",
                       name: "Lilly",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id
                        )

    visit "/pets"
    have_current_path "/pets"
    within "#pet-#{lilly.id}" do
      expect(page).to have_content('Lilly')
      expect(page).to have_content('4')
      expect(page).to have_content('Female')
      expect(page).to have_content('Maxxxx Shelter')
    end
  end
end

# User Story 18, Pet Links
#
# As a visitor
# When I click on the name a pet anywhere on the site
# Then that link takes me to that Pet's show page
