require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can update shelters" do
    shelter_1 = Shelter.create(name: "Anotha Shelta",
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

  visit "/shelters/#{shelter_1.id}"
  click_link 'Edit This Review'
  have_current_path "/shelters/#{shelter_1.id}/review/edit"
  fill_in 'title', with: 'Edited Review Title'
  fill_in 'content', with: 'Edited Review Content'
  fill_in 'rating', with: '0'
  fill_in 'picture', with: 'https://s3.amazonaws.com/lowres.cartoonstock.com/sport-apocalypse-apocalyptic-dead_worlds-dying_worlds-free_time-gra110412_low.jpg'
  click_on('Submit')
  have_current_path "/shelters/#{shelter_1.id}"
  expect(page).to have_content('Edited Review Title')
  expect(page).to have_content('Edited Review Content')
  expect(page).to have_content('0')
  end
end