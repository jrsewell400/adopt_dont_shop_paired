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
                      adopted: "Adoptable",
                      shelter_id: @shelter_1.id)

    @mojo = Pet.create(image: "https://files.brief.vet/2019-07/pelvic-limb_HEADER.png",
                      name: "Mojo Jojo",
                      description: "Annoying little chomper",
                      age: "40",
                      sex: "Female",
                      adopted: "Adoptable",
                      shelter_id: @shelter_2.id)

    @harry = Pet.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/31131032/Golden-Retriever-Puppy-Harry-Potter.jpg",
                      name: "Harry Potter",
                      description: "The Boy Who Lived",
                      age: "12",
                      sex: "Male",
                      adopted: "Adoptable",
                      shelter_id: @shelter_2.id)

    @app1 = Application.create(name: "John Doe",
                               address: "Johnny St",
                               city: "Johnsonville",
                                state: "TX",
                                zip: "54545",
                                phone_number: "972 333-5444",
                                description: "My name is Johnny, so my home is nice.")

    @app2 = Application.create(name: "Johnny Bravo",
                               address: "Bravo St",
                               city: "Brova",
                                state: "CA",
                                zip: "10000",
                                phone_number: "972 828-9080",
                                description: "Do the Johnny Bravo!")

    @pet_app1 = ApplicationPet.create(application_id: @app1.id,
                                      pet_id: @harry.id)

    @pet_app2 = ApplicationPet.create(application_id: @app1.id,
                                      pet_id: @mojo.id)

    @pet_app3 = ApplicationPet.create(application_id: @app2.id,
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
  it "When I visit an applications show page there are links to approve the application" do
    visit "/application/#{@app1.id}"
    click_on("Approve #{@mojo.name}")
    have_current_path "/pets/#{@lilly.id}"
    expect(page).to have_content("Adoption Pending")
    expect(page).to have_content("Mojo Jojo is on hold for John Doe")
  end
  it "When a pet has more than one application for them and one has already been approved, you cannot approve any more applications" do
    visit "/application/#{@app1.id}"
    click_on("Approve #{@mojo.name}")
    visit "/application/#{@app2.id}"
    expect(page).to_not have_content("Approve #{@mojo.name}")
    visit "/application/#{@app2.id}"
    expect(page).to have_content(@app2.name)
    save_and_open_page
  end
end

# (This can be done by either taking away the option to approve the application, or having a flash message pop up saying that no more applications can be approved for this pet at this time)
