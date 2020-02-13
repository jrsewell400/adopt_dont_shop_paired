require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can click all pets" do
    shelter_1 = Shelter.create(name: "Shelters 'r Us",
                               address: "1042 N Marion St",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80218")

    lilly = Pet.create!(image: "pets/golden.jpg",
                        name: "Lilly",
                        description: "Black Dog",
                        age: "4",
                        sex: "Female",
                        shelter_id: shelter_1.id)

    visit "/shelters"
    click_on shelter_1.name
    click_on "Pets"
    click_on lilly.name
    have_current_path "/pets/#{lilly.id}"
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Black Dog')
    expect(page).to have_content('4')
    expect(page).to have_content('Female')
  end
end
