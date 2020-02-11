require 'rails_helper'

RSpec.describe "individidual pet pages", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "This is a Shelter",
                                address: "1042 N Marion St",
                                city: "Denver",
                                state: "Colorado",
                                zip: "80218"
                               )

    @shelter_2 = Shelter.create(name: "My Other Shelter",
                                address: "15580 Quorum Dr",
                                city: "Dallas",
                                state: "Texas",
                                zip: "75001"
                               )

    @lilly = Pet.create(image: "pets/golden.jpg",
                        name: "Lilly",
                        description: "Black Dog",
                        age: "4",
                        sex: "Female",
                        shelter_id: @shelter_1.id)

    @mojo = Pet.create(image: "pets/golden.jpg",
                       name: "Mojo Jojo",
                       description: "Annoying little chomper",
                       age: "40",
                       sex: "Female",
                       shelter_id: @shelter_2.id)
  end

  it "can delete individual pets" do
    visit "/pets"
    expect(page).to have_content('This is a Shelter')
    expect(page).to have_content('Mojo Jojo')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('4')
    expect(page).to have_content('Female')
    expect(page).to have_content('40')
    visit "/pets/#{@lilly.id}"
    have_current_path "/pets/#{@lilly.id}"
    click_button "Delete"
    have_current_path "/pets"
    expect(page).to_not have_content('Lilly')
  end

  it "can delete a pet" do
    visit "/pets"
    expect(page).to have_content('Lilly')
    within "#pet-#{@lilly.id}" do
      click_button "Delete"
    end
    expect(page).to_not have_content('Lilly')
  end
end