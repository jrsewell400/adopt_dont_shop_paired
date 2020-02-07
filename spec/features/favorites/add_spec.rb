require 'rails_helper'

RSpec.describe "favorites indication", type: :feature do
  it "can track a pet through favorites" do
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

  visit "/pets/#{lilly.id}"
  click_on("Favorite Pet")
  have_current_path "/pets/#{lilly.id}"
  expect(page).to have_content("You have added Lilly to Favorites!")
    within "nav" do
      expect(page).to have_content("Number of Favorites: 1")
    end
  end
end


# User Story 9, Favorite Creation
#
# As a visitor
# When I visit a pet's show page
# I see a button or link to favorite that pet
# When I click the button or link
# I'm taken back to that pet's show page
# I see a flash message indicating that the pet has been added to my favorites list
# The favorite indicator in the nav bar has incremented by one
