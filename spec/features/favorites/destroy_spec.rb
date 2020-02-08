require 'rails_helper'

RSpec.describe "On a pets show page," do
  it "If a pet has been favorited, I see a button to remove it from favorites." do
    shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                              address:       "1042 N Marion St",
                              city:          "Denver",
                              state:         "Colorado",
                              zip:          "80218")

    lilly = Pet.create(image: "https://thehappypuppysite.com/wp-content/uploads/2019/03/How-Long-Do-Labrador-Retriever-Live-long.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id)


  visit "/pets/#{lilly.id}"
  click_button("Favorite Pet")
  expect(page).to have_selector(:link_or_button, 'Remove Pet From Favorites')
  expect(page).to_not have_selector(:link_or_button, 'Favorite Pet')
  click_on("Remove Pet From Favorites")
  have_current_path "/pets/#{lilly.id}"
  expect(page).to have_content("#{lilly.name} has been removed from favorites.")
  expect(page).to have_selector(:link_or_button, 'Favorite Pet')
  expect(page).to have_content("Number of Favorites: 0")
  end
end
