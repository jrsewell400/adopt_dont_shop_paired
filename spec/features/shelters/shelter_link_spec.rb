require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can click all shelters" do
    shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218")

    shelter_2 = Shelter.create(name:       "My Other Shelter",
                               address:       "15580 Quorum Dr",
                               city:          "Dallas",
                               state:         "Texas",
                               zip:          "75001")

    review1 = Review.create(
                            title: "Good Shelter",
                            rating: 5,
                            content: "Fantastic staff and cleanily area for animals.",
                            picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
                            shelter_id: shelter_1.id
                            )

    visit "/shelters"
    click_on "Shelters 'r Us"
    have_current_path "/shelters/#{shelter_1.id}"
  end
end