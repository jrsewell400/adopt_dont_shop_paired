require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "shows all pets in the database" do
    shelter_1 = Shelter.create(name:       "Maxxxx Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    lilly = Pet.create(image: "pets/lab.jpg",
                       name: "Lilly",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id
                        )

    visit "/pets"
    have_current_path "/pets"
    expect(page).to have_content('Pets')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('4')
    expect(page).to have_content('Female')
    expect(page).to have_content('Maxxxx Shelter')
    # save_and_open_page
  end
end

# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
