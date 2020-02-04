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
end


# User Story 14, Shelter Delete From Shelter Index Page
#
# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter
