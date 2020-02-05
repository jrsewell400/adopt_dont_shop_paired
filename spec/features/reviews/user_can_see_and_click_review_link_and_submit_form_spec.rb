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
                        picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
                        shelter_id: shelter_1.id
                        )
    
      visit "/shelters/#{shelter_1.id}"

      click_link "Create New Review"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/new")
      expect(page).to have_content("Create New Review:")
      expect(page).to have_content("Title")
      expect(page).to have_content("Rating")
      expect(page).to have_content("Content")
      expect(page).to have_content("Picture")
      
      fill_in 'title', with: 'Best shelter ever!'
      fill_in 'rating', with: 5
      fill_in 'content', with: 'Staff was friendly and they take great care of the pets!'
      fill_in 'picture', with: 'https://www.rd.com/wp-content/uploads/2017/10/These-Funny-Dog-Videos-Are-the-Break-You-Need-Right-Now_493370860-Jenn_C-760x506.jpg'
      
      click_on("Create New Review")
      
      have_current_path "/shelters/#{shelter_1.id}"
      
      expect(page).to have_content("Best shelter ever!")
      expect(page).to have_content('5')
      expect(page).to have_content('Staff was friendly and they take great care of the pets!')
      expect(page).to have_content('https://www.rd.com/wp-content/uploads/2017/10/These-Funny-Dog-Videos-Are-the-Break-You-Need-Right-Now_493370860-Jenn_C-760x506.jpg')
    end
  end
end