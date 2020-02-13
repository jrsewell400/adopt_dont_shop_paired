require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "shows all pets in the database" do
    shelter_1 = Shelter.create(name:       "Generic Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    lilly = Pet.create(image: "https://static.boredpanda.com/blog/wp-content/uploads/2020/01/funny-dog-teeth-toofers-3-5e255a95cd31e__700.jpg",
                       name: "Lilly",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id
                        )

    visit "/pets"
    have_current_path "/pets"
    within "#pet-#{lilly.id}" do
      expect(page).to have_content('Lilly')
      expect(page).to have_content('4')
      expect(page).to have_content('Female')
      expect(page).to have_content('Generic Shelter')
      expect(page).to have_css("img[src*='#{lilly.image}']")
    end
  end
end 
