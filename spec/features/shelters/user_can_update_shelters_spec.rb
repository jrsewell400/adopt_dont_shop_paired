require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can update shelters" do
    shelter_1 = Shelter.create!(name:       "Anotha Shelta",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")

                          review1 = Review.create(
                                                  title: "Good Shelter",
                                                  rating: 5,
                                                  content: "Fantastic staff and cleanily area for animals.",
                                                  picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg"
                                                  )

  visit '/shelters'

  have_current_path "/shelters "
  click_link 'Anotha Shelta'
  have_current_path "/shelters/#{shelter_1.id}"
  click_link 'Edit This Shelter'
  have_current_path "/shelters/#{shelter_1.id}/edit"
  fill_in 'name', with: 'Edited Shelter Name'
  fill_in 'address', with: 'Edited Shelter Address'
  fill_in 'city', with: 'Edited Shelter City'
  fill_in 'state', with: 'Edited Shelter State'
  fill_in 'zip', with: 'Edited Shelter Zip'
  click_on('submitter')
  have_current_path "/shelters/#{shelter_1.id}"
  expect(page).to have_content('Edited Shelter Name')
  expect(page).to have_content('Edited Shelter Address')
  expect(page).to have_content('Edited Shelter City')
  expect(page).to have_content('Edited Shelter State')
  expect(page).to have_content('Edited Shelter Zip')
  end
end


# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
