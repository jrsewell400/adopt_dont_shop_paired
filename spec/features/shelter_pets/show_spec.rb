require 'rails_helper'

RSpec.describe "shelters pets", type: :feature do
  it "can show all pets in a shelter" do
    shelter_1 = Shelter.create(name: "Maxxxx Shelter",
                               address: "1042 N Marion St",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80218"
                              )

    shelter_2 = Shelter.create(name: "Shelters Anonymous",
                               address: "15580 Quorum Dr",
                               city: "Dallas",
                               state: "Texas",
                               zip:"75001"
                              )

    lilly = Pet.create(image: "pets/lab.jpg",
                       name: "Lilly",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id
                      )

    max = Pet.create(image: "pets/lab.jpg",
                     name: "Max",
                     age: "14",
                     sex: "Male",
                     shelter_id: shelter_1.id
                    )

    mary = Pet.create(image: "pets/lab.jpg",
                      name: "Mary",
                      age: "1",
                      sex: "Female",
                      shelter_id: shelter_2.id
                     )

  visit "/shelters/#{shelter_1.id}/pets"
  expect(page).to have_content('Lilly')
  expect(page).to have_content('4')
  expect(page).to have_content('Female')
  expect(page).to have_content('Max')
  expect(page).to have_content('14')
  expect(page).to have_content('Male')
  end
end
