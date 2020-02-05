require 'rails_helper'

RSpec.describe "individual shelter pages", type: :feature do
  it "can see all reviews of a shelter" do
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
    expect(page).to have_content(review1.title)
    expect(page).to have_content(review1.content)
    expect(page).to have_content(review1.rating)
  end
end

# User Story 2, Shelter Reviews
#
# As a visitor,
# When I visit a shelter's show page,
# I see a list of reviews for that shelter
# Each review will have:
# - title
# - rating
# - content
# - an optional picture
