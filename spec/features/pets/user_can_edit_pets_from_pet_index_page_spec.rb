require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can edit pets from pet index page" do
    shelter_1 = Shelter.create(name:       "This is a Shelter",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")

    shelter_2 = Shelter.create(name:       "My Other Shelter",
                         address:       "15580 Quorum Dr",
                         city:          "Dallas",
                         state:         "Texas",
                          zip:          "75001")

    lilly = Pet.create(image: "pets/golden.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id)



    visit '/pets'
    click_link "Update Pet"
    fill_in 'name', with: 'Astro'
    fill_in 'description', with: 'Little White Dog'
    fill_in 'age', with: '909'
    fill_in 'sex', with: 'Male'
    fill_in 'adopted', with: 'Pending Adoption'
    click_on('submitter')
    expect(page).to have_content('Astro')
    expect(page).to have_content('909')
    expect(page).to have_content('Little White Dog')
    expect(page).to have_content('Male')
    expect(page).to have_content('Pending Adoption')
  end
end

# User Story 15, Pet Update From Pets Index Page
#
# As a visitor
# When I visit the pets index page or a shelter pets index page
# Next to every pet, I see a link to edit that pet's info
# When I click the link
# I should be taken to that pets edit page where I can update its information just like in User Story 11
