require 'rails_helper'

RSpec.describe "individual shelter pages", type: :feature do
  it "can delete individual shelters" do
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
    review1 = Review.create(
                          title: "Good Shelter",
                          rating: 5,
                          content: "Fantastic staff and cleanily area for animals.",
                          picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg"
                          )
  visit "/shelters"
  have_current_path "/shelters"
  expect(page).to have_content('This is a Shelter')
  expect(page).to have_content('My Other Shelter')
  click_link "#{shelter_1.name}"
  have_current_path "/shelters/#{shelter_1.name}"
  click_button "Delete"
  have_current_path "/shelters"
  expect(page).to have_content('My Other Shelter')
  expect(page).to_not have_content('This is a Shelter')
  # save_and_open_page
  end
end



# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter