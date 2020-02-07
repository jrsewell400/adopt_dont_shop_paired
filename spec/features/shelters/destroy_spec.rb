require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can update shelters" do
    shelter_1 = Shelter.create!(name:       "Anotha Shelta",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")

  visit '/shelters'
  click_button 'Delete This Shelter'
  have_current_path "/shelters"
  expect(page).to_not have_content('Anotha Shelta')
  end
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
                          picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
                          shelter_id: shelter_1.id
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
  end
end


# User Story 14, Shelter Delete From Shelter Index Page
#
# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter
