require 'rails_helper'

RSpec.describe "create pets", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Generic Shelter",
      address: "1042 N Marion St",
      city: "Denver",
      state: "Colorado",
      zip: "80218"
    )

    @review1 = Review.create(title: "Good Shelter",
      rating: 5,
      content: "Fantastic staff and cleanily area for animals.",
      picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
      shelter_id: @shelter_1.id
    )
  end

  it "can create a pet" do
    visit "/shelters/#{@shelter_1.id}"
    click_link "New Pet"
    expect(page).to have_content("Name")
    expect(page).to have_content("Image")
    expect(page).to have_content("Description")
    expect(page).to have_content("Age")
    expect(page).to have_content("Sex")
    fill_in 'name', with: 'Lilly'
    fill_in 'age', with: '6'
    fill_in 'description', with: 'Black and beautiful'
    fill_in 'image', with: 'pets/lab.jpg'
    fill_in 'age', with: '6'
    fill_in 'sex', with: 'Female'
    click_on("Create Pet")
    have_current_path "/shelters/#{@shelter_1.id}/pets"
  end

  it "if I try to create a pet and fail to fill out a form I see that forms attributes that I failed to fill out" do
    visit "/shelters/#{@shelter_1.id}"
    click_link "New Pet"
    fill_in 'name', with: 'Trixie'
    fill_in 'image', with: ''
    fill_in 'description', with: 'Thats one pretty dog'
    fill_in 'age', with: '6'
    fill_in 'sex', with: 'Female'
    click_on('Create Pet')
    expect(page).to have_content("Image can't be blank")
  end
end
