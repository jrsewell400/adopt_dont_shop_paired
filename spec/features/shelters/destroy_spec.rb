require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can update shelters" do
    shelter_1 = Shelter.create!(name:       "Anotha Shelta",
                         address:       "1042 N Marion St",
                         city:          "Denver",
                         state:         "Colorado",
                          zip:          "80218")

    visit '/shelters'
    click_on('Delete This Shelter')
    have_current_path "/shelters"
    expect(page).to_not have_content('Anotha Shelta')
  end

  it "can delete individual shelters" do
    shelter_1 = Shelter.create(name:       "This is a Shelter",
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
    visit "/shelters"
    expect(page).to have_content('This is a Shelter')
    click_on("Delete This Shelter")
    have_current_path "/shelters"
    expect(page).to_not have_content('This is a Shelter')
  end
end