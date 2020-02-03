require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can delete a pet" do
    shelter_1 = Shelter.create(name:       "Maxxxx Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    lilly = Pet.create(image: "pets/golden.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id
                        )
    visit "/pets"
    expect(page).to have_content('Lilly')
    click_button "Delete"
    expect(page).to_not have_content('Lilly')
  end
end





#   User Story 16, Pet Delete From Pets Index Page
#
# As a visitor
# When I visit the pets index page or a shelter pets index page
# Next to every pet, I see a link to delete that pet
# When I click the link
# I should be taken to the pets index page where I no longer see that pet
