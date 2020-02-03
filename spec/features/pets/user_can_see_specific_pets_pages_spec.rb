require 'rails_helper'

RSpec.describe "individual pet pages", type: :feature do

  it "shows attributes for each pet" do
    shelter_1 = Shelter.create(name:       "Maxxxx Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    lilly = Pet.create(image: "pets/lab.jpg",
                       name: "Lilly",
                       description: "The best damn dawg in the whole wide world",
                       age: "4",
                       sex: "Female",
                       adopted: "Adoptable",
                       shelter_id: shelter_1.id
                        )

   visit "/pets/#{lilly.id}"
   # save_and_open_page
   expect(page).to have_content('Lilly')
   expect(page).to have_content('The best damn dawg in the whole wide world')
   expect(page).to have_content('4')
   expect(page).to have_content('Female')
   expect(page).to have_content('Adoptable')
  end
end


# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
