require 'rails_helper'

RSpec.describe 'As a visitor, when I go to an applications show page' do
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

    @app1 = Application.create(name: "John Doe",
                               address: "Johnny St",
                               city: "Johnsonville",
                                state: "TX",
                                zip: "54545",
                                phone_number: "972 333-5444",
                                description: "My name is Johnny, so my home is nice.")

    @pet_app1 = ApplicationPet.create(application_id: @app1.id,
                                      pet_id: @harry.id)

    @pet_app2 = ApplicationPet.create(application_id: @app1.id,
                                      pet_id: @mojo.id)
    end
  it "I should see all of the applicant information" do
    visit "/application/#{@app1.id}"
    expect(page).to have_content(@app1.name)
    expect(page).to have_content(@app1.address)
    expect(page).to have_content(@app1.city)
    expect(page).to have_content(@app1.state)
    expect(page).to have_content(@app1.zip)
    expect(page).to have_content(@app1.phone_number)
    expect(page).to have_content(@app1.description)
    expect(page).to have_content(@mojo.name)
    expect(page).to have_content(@harry.name)
    click_on(@mojo.name)
    have_current_path "/pets/#{@mojo.id}"
  end
  it "on pets show page, I see a link to view all applications for this pet" do
    visit "/pets/#{@mojo.id}"
    click_on("View Applications")
    expect(page).to have_content(@app1.name)
    click_on(@app1.name)
    have_current_path "/application/#{@app1.id}"
  end
  it "When I visit a pets application page and there is no application for them, I see an message indicating just that" do
    visit "/pets/#{@lilly.id}"
    click_on("View Applications")
    expect(page).to have_content("This Pet has no applications yet.")  
  end
end

# When I visit a pet applications index page for a pet that has no applications on them
# I see a message saying that there are no applications for this pet yet
