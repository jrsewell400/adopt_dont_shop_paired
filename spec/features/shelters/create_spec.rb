require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  before :each do 
    @shelter_1 = Shelter.create(name: "Shelters 'r Us",
                                address: "1042 N Marion St",
                                city: "Denver",
                                state: "Colorado",
                                zip: "80218"
                               )

    @review1 = Review.create(title: "Good Shelter",
                             rating: 5,
                             content: "Fantastic staff and cleanly area for animals.",
                             picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg"
                            )
  end
  
  it "has a link to create a new shelter" do
    visit "/shelters"
    have_current_path "/shelters"
    click_link 'New Shelter'
    have_current_path "/shelters/new"
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_button("Create Shelter")
  end

  it "has a form to create a new shelter" do
    visit "/shelters"
    click_on("New Shelter")
    have_current_path "/shelters/new"
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    fill_in 'name', with: 'New Shelter 36'
    fill_in 'address', with: '1234 Rabbit ln'
    fill_in 'city', with: 'Rabbitville'
    fill_in 'state', with: 'FL'
    fill_in 'zip', with: '12336'
    click_on("Create Shelter")
    have_current_path "/shelters"
    expect(page).to have_content('New Shelter 36')
    click_on("New Shelter 36")
    have_current_path "/shelters/#{@shelter_1.id}"
    expect(page).to have_content('New Shelter 36')
    expect(page).to have_content('1234 Rabbit ln')
    expect(page).to have_content('Rabbitville')
    expect(page).to have_content('FL')
    expect(page).to have_content('12336')
  end
end