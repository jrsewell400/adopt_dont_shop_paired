require 'rails_helper'

RSpec.describe "On a pets show page as a visitor," do
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
    @mojo = Pet.create(image: "https://files.brief.vet/2019-07/pelvic-limb_HEADER.png",
                        name: "Mojo Jojo",
                        description: "Annoying little chomper",
                        age: "40",
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

  
  it "When I favorite a pet, and visit the favorites index page I see a link to remove that pet from favorites" do
    visit "/pets/#{@lilly.id}"
    click_button("Favorite Pet")
    visit "/favorites"
    click_on("Remove Favorite")
    visit '/favorites'
    expect(page).to_not have_content("#{@lilly.name}")
    expect(page).to have_content("Number of Favorites: 0")
  end
 
  it "When I have favorited pets, and visit the index page, I can remove all favorited pets with one button" do
    visit "/pets/#{@lilly.id}"
    click_button("Favorite Pet")
    visit "/pets/#{@mojo.id}"
    click_button("Favorite Pet")
    visit "/favorites"
    click_button("Remove All Favorites")
    have_current_path "/favorites"
    expect(page).to have_content("There are no favorited pets to show!")
    expect(page).to have_content("Number of Favorites: 0")
  end
end
