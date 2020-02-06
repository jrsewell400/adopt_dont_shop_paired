require 'rails_helper'

RSpec.describe "edit pets", type: :feature do
  it "can edit a pet" do
    shelter_1 = Shelter.create(name:       "Maxxxx Shelter",
                               address:       "1042 N Marion St",
                               city:          "Denver",
                               state:         "Colorado",
                               zip:          "80218"
                               )

    lilly = Pet.create(image: "pets/golden.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id
                        )
    visit "/pets/#{lilly.id}"
    click_link "Update Pet"
    fill_in 'name', with: 'Astro'
    fill_in 'description', with: 'Little White Dog'
    fill_in 'age', with: '909'
    fill_in 'sex', with: 'Male'
    fill_in 'adopted', with: 'Pending Adoption'
    click_on('submitter')
    expect(page).to have_content('Astro')
    expect(page).to have_content('909')
    expect(page).to have_content('Little White Dog')
    expect(page).to have_content('Male')
    expect(page).to have_content('Pending Adoption')
  end
end


#     User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
