require 'rails_helper'

RSpec.describe "On a pets show page," do
  before :each do
    @shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                              address:       "1042 N Marion St",
                              city:          "Denver",
                              state:         "Colorado",
                              zip:          "80218")

    @lilly = Pet.create(image: "https://thehappypuppysite.com/wp-content/uploads/2019/03/How-Long-Do-Labrador-Retriever-Live-long.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: @shelter_1.id)
  end
  it "If a pet has been favorited, I see a button to remove it from favorites." do

  visit "/pets/#{@lilly.id}"
  click_button("Favorite Pet")
  expect(page).to have_selector(:link_or_button, 'Remove Pet From Favorites')
  expect(page).to_not have_selector(:link_or_button, 'Favorite Pet')
  click_on("Remove Pet From Favorites")
  have_current_path "/pets/#{@lilly.id}"
  expect(page).to have_content("#{@lilly.name} has been removed from favorites.")
  expect(page).to have_selector(:link_or_button, 'Favorite Pet')
  expect(page).to have_content("Number of Favorites: 0")
  end

  describe "As a visitor" do
    it "When I favorite a pet, and visit the favorites index page I see a link to remove that pet from favorites" do

    visit "/pets/#{@lilly.id}"
    click_button("Favorite Pet")
    visit "/favorites"
    click_on("Remove Favorite")
    visit '/favorites'
    expect(page).to_not have_content("#{@lilly.name}")
    expect(page).to have_content("Number of Favorites: 0")
    end
  end
end
# User Story 13, Remove a Favorite from Favorites Page
#
# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# Next to each pet, I see a button or link to remove that pet from my favorites
# When I click on that button or link to remove a favorite
# A delete request is sent to "/favorites/:pet_id"
# And I'm redirected back to the favorites page where I no longer see that pet listed
# And I also see that the favorites indicator has decremented by 1
