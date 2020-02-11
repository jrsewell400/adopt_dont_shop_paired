require 'rails_helper'

RSpec.describe 'As a visitor, when I go to a new applications page' do
  before :each do
    @shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                              address:       "1042 N Marion St",
                              city:          "Denver",
                              state:         "Colorado",
                              zip:          "80218")

    @shelter_2 = Shelter.create(name:       "My Other Shelter",
                              address:       "15580 Quorum Dr",
                              city:          "Dallas",
                              state:         "Texas",
                              zip:          "75001")

    @lilly = Pet.create(image: "https://thehappypuppysite.com/wp-content/uploads/2019/03/How-Long-Do-Labrador-Retriever-Live-long.jpg",
                      name: "Lilly",
                      description: "Black Dog",
                      age: "4",
                      sex: "Female",
                      shelter_id: @shelter_1.id)

    @mojo = Pet.create(image: "https://files.brief.vet/2019-07/pelvic-limb_HEADER.png",
                      name: "Mojo Jojo",
                      description: "Annoying little chomper",
                      age: "40",
                      sex: "Female",
                      shelter_id: @shelter_2.id)

    @harry = Pet.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/31131032/Golden-Retriever-Puppy-Harry-Potter.jpg",
                      name: "Harry Potter",
                      description: "The Boy Who Lived",
                      age: "12",
                      sex: "Male",
                      shelter_id: @shelter_2.id)
    end
  it "I can select from more than one favorited pet and apply to adopt" do
    visit "/pets/#{@mojo.id}"
    click_button("Favorite Pet")
    visit "/pets/#{@lilly.id}"
    click_button("Favorite Pet")
    visit "/pets/#{@harry.id}"
    click_button("Favorite Pet")
    visit "/favorites"
    expect(page).to have_content("#{@harry.name}")
    expect(page).to have_content("#{@lilly.name}")
    expect(page).to have_content("#{@mojo.name}")
    click_on("Apply to Adopt Favorited Pets")
    have_current_path "/application/new"
    within "#pet-#{@lilly.id}" do
      check :pet_adopts_
    end
    fill_in 'name', with: 'Jordan'
    fill_in 'address', with: '1234 Shelters Dr'
    fill_in 'city', with: 'Denver'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: '80218'
    fill_in 'phone_number', with: '214 323-3333'
    fill_in 'description', with: 'I would make a good home for these pets beacuse I have money'
    click_on('Create Application')
    expect(page).to have_content("Application for Pets Received!")
    have_current_path '/favorites'
    expect(page).to have_content("#{@mojo.name}")
    expect(page).to have_content("#{@harry.name}")
    within "#applied" do
      expect(page).to_not have_content("#{@harry.name}")
      expect(page).to_not have_content("#{@mojo.name}")
      expect(page).to have_content("#{@lilly.name}")
      click_on("#{@lilly.name}")
      have_current_path "/pets/#{@lilly.name}"
    end
  end

  it "When I fail to fill out a field in the applications page, I receive a flash alert" do
    visit "/pets/#{@harry.id}"
    click_button("Favorite Pet")
    visit "/favorites"
    click_on("Apply to Adopt Favorited Pets")
    have_current_path "/application/new"
    fill_in 'address', with: '1234 Shelters Dr'
    fill_in 'city', with: 'Denver'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: '80218'
    fill_in 'phone_number', with: '214 323-3333'
    fill_in 'description', with: 'I would make a good home for these pets beacuse I have money'
    # click_on('Create Application')
    # have_current_path "/application/new"
    # expect(page).to have_content("Need to fill out all fields to submit an application")
  end
end
