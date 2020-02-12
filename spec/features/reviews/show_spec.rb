require 'rails_helper'

RSpec.describe "individual shelter pages", type: :feature do
  it "can see all reviews of a shelter" do
    shelter_1 = Shelter.create(name: "Shelters 'r Us",
                               address: "1042 N Marion St",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80218"
                              )

    review1 = Review.create(title: "Good Shelter",
                            rating: 5,
                            content: "Fantastic staff and cleanily area for animals.",
                            picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
                            shelter_id: shelter_1.id
                           )

    review2  = Review.create(title: "Great Shelter",
                             rating: 5,
                             content: "Love this place.",
                             picture: "https://www.constructionspecifier.com/wp-content/uploads/2019/09/1.jpg",
                             shelter_id: shelter_1.id
                            )

    visit "/shelters/#{shelter_1.id}"
    within "#review-#{review1.id}" do
      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.content)
      expect(page).to have_content(review1.rating)
      expect(page).to have_css("img[src*='#{review1.picture}']")
    end
    within "#review-#{review2.id}" do
      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.content)
      expect(page).to have_content(review2.rating)
      expect(page).to have_css("img[src*='#{review2.picture}']")
    end
  end
end