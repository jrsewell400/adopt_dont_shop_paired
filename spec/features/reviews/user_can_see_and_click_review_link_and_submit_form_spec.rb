require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a shelter's show page I see a link to add a new review for this shelter" do
    it "then I can click the link and be taken to new page where I can add a new review." do
      shelter_1 = Shelter.create(
                         name:       "Shelters 'r Us",
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
    
      visit "/shelters/#{shelter_1.id}"

      click_link "Create New Review"                  
    
      expect(page).to have_link("Create New Review")
      expect(current_path).to eq("/shelters/#{shelter_1.id}/new")
      expect(page).to have_content("Create New Review")
    end
  end
end


# US3
# As a visitor,
# When I visit a shelter's show page
# I see a link to add a new review for this shelter.
# When I click on this link, I am taken to a new review path
# On this new page, I see a form where I must enter:

# title
# rating
# content
# I also see a field where I can enter an optional image (web address)
# When the form is submitted, I should return to that shelter's show page
# and I can see my new review