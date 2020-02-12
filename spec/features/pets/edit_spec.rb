require 'rails_helper'

RSpec.describe "edit pets", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Maxxxx Shelter",
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
                        shelter_id: @shelter_1.id
                       )
  end

  it "can edit a pet" do
    visit "/pets/#{@lilly.id}"
    click_link "Update Pet"
    fill_in 'name', with: 'Astro'
    fill_in 'description', with: 'Little White Dog'
    fill_in 'age', with: '909'
    fill_in 'sex', with: 'Male'
    click_on('Submit')
    expect(page).to have_content('Astro')
    expect(page).to have_content('909')
    expect(page).to have_content('Little White Dog')
    expect(page).to have_content('Male')
  end

  it "can edit pets from pet index page" do
    visit '/pets'
    click_link "Update Pet"
    fill_in 'name', with: 'Astro'
    fill_in 'description', with: 'Little White Dog'
    fill_in 'age', with: '909'
    fill_in 'sex', with: 'Male'
    click_on('Submit')
    expect(page).to have_content('Astro')
    expect(page).to have_content('909')
    expect(page).to have_content('Little White Dog')
    expect(page).to have_content('Male')
  end

  it "if I try to edit a pet and fail to fill out a form I see that forms attributes that I failed to fill out" do
    visit "/pets"
    click_link "Update Pet"
    fill_in 'name', with: 'Trixie'
    fill_in 'image', with: ''
    fill_in 'description', with: 'Thats one pretty dog'
    fill_in 'age', with: '6'
    fill_in 'sex', with: 'Female'
    click_on('Submit')
    expect(page).to have_content("Image can't be blank")
  end
end
