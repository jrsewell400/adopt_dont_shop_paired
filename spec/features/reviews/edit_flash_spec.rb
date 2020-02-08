require 'rails_helper'

RSpec.describe "New Reviews pages", type: :feature do
  it "receives a flash message when you edit a review successfully and unsuccessfully" do
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

    visit "/shelters/#{review1.shelter_id}/review/#{review1.id}/edit"

    fill_in 'title', with: 'Best shelter ever!'
    fill_in 'rating', with: 5
    fill_in 'content', with: 'Staff was friendly and they take great care of the pets!'
    fill_in 'picture', with: 'https://www.rd.com/wp-content/uploads/2017/10/These-Funny-Dog-Videos-Are-the-Break-You-Need-Right-Now_493370860-Jenn_C-760x506.jpg'
    click_on("Submit")
    expect(page).to have_content("Review successfully edited.")
    click_on("Edit This Review")
    fill_in 'title', with: 'Best shelter ever!'
    fill_in 'rating', with: ''
    fill_in 'content', with: 'Staff was friendly and they take great care of the pets!'
    fill_in 'picture', with: 'https://www.rd.com/wp-content/uploads/2017/10/These-Funny-Dog-Videos-Are-the-Break-You-Need-Right-Now_493370860-Jenn_C-760x506.jpg'
    click_on("Submit")
    expect(page).to have_content("Need to fill in a Title, Rating, and Content in order to submit a Shelter Review.")
  end
end
