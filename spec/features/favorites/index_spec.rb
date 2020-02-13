require 'rails_helper'

RSpec.describe "As a visitor," do
  before :each do
    @shelter_1 = Shelter.create(name: "Shelters 'r Us",
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

    @lilly = Pet.create(image: "https://thehappypuppysite.com/wp-content/uploads/2019/03/How-Long-Do-Labrador-Retriever-Live-long.jpg",
                        name: "Lilly",
                        description: "Black Dog",
                        age: "4",
                        sex: "Female",
                        shelter_id: @shelter_1.id
                       )

    @mojo = Pet.create(image: "https://files.brief.vet/2019-07/pelvic-limb_HEADER.png",
                       name: "Mojo Jojo",
                       description: "Annoying little chomper",
                       age: "40",
                       sex: "Female",
                       shelter_id: @shelter_2.id
                      )

    @harry = Pet.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/31131032/Golden-Retriever-Puppy-Harry-Potter.jpg",
                        name: "Harry Potter",
                        description: "The Boy Who Lived",
                        age: "12",
                        sex: "Male",
                        shelter_id: @shelter_2.id
                       )
    end

  it "I see a favorite indicator in my navigation bar." do
    visit '/'
    within('#nav') do
        expect(page).to have_content("Number of Favorites:")
    end

    visit '/shelters'
    within('#nav') do
        expect(page).to have_content("Number of Favorites:")
    end

    visit '/pets'
    within('#nav') do
        expect(page).to have_content("Number of Favorites:")
    end

    visit '/'
    click_on('Number of Favorites:')
    expect(current_path).to eq('/favorites')
  end

  it "shows a count of pets in my favorite list." do
    visit "/pets/#{@mojo.id}"
    click_button("Favorite Pet")
    within('#nav') do
      expect(page).to have_content("Number of Favorites: 1")
    end
    visit "/pets/#{@lilly.id}"
    click_button("Favorite Pet")
    within('#nav') do
      expect(page).to have_content("Number of Favorites: 2")
    end
  end

  it "I see a Favorites index and the pet name (as a link) and image of the pet that have been favorited" do
    visit "/pets/#{@mojo.id}"
    click_button("Favorite Pet")
    click_on('Number of Favorites:')
    expect(current_path).to eq('/favorites')
    within "#pet-#{@mojo.id}" do
      expect(page).to have_content(@mojo.name)
      expect(page).to have_css("img[src*='#{@mojo.image}']")
    end
    visit "/pets/#{@lilly.id}"
    click_button("Favorite Pet")
    click_on('Number of Favorites:')
    within "#pet-#{@lilly.id}" do
      expect(page).to have_link(@lilly.name)
      expect(page).to have_css("img[src*='#{@lilly.image}']")
      click_on(@lilly.name)
      have_current_path "/pets/#{@lilly.id}"
    end
  end

  it "when I haven't added any favorites and I visit my favorites page then I see text saying I have no favorited pets" do
    visit "/"
    click_on('Number of Favorites:')
    expect(page).to have_content("There are no favorited pets to show!")
  end

  it "when I've added pets to favorites and I visit favorites index page I see a link for adopting my favorited pets and that link takes me to a new application form" do
    visit "/pets/#{@mojo.id}"
    click_button("Favorite Pet")
    click_on('Number of Favorites:')
    expect(page).to have_link("Apply to Adopt Favorited Pets")
    click_on("Apply to Adopt Favorited Pets")
    expect(current_path).to eq('/application/new')
  end
end
