require 'rails_helper'

RSpec.describe "As a visitor," do
    it "I see a favorite indicator in my navigation bar and it shows a count of pets in my favorite list." do
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

  it "I see a Favorites index and the pet name and image of the pet that have been favorited" do
    shelter_1 = Shelter.create(name:       "Shelters 'r Us",
                              address:       "1042 N Marion St",
                              city:          "Denver",
                              state:         "Colorado",
                              zip:          "80218")

    shelter_2 = Shelter.create(name:       "My Other Shelter",
                              address:       "15580 Quorum Dr",
                              city:          "Dallas",
                              state:         "Texas",
                              zip:          "75001")

    lilly = Pet.create(image: "https://thehappypuppysite.com/wp-content/uploads/2019/03/How-Long-Do-Labrador-Retriever-Live-long.jpg",
                       name: "Lilly",
                       description: "Black Dog",
                       age: "4",
                       sex: "Female",
                       shelter_id: shelter_1.id)

    mojo = Pet.create(image: "https://files.brief.vet/2019-07/pelvic-limb_HEADER.png",
                       name: "Mojo Jojo",
                       description: "Annoying little chomper",
                       age: "40",
                       sex: "Female",
                       shelter_id: shelter_2.id)

    visit "/pets/#{mojo.id}"

    click_on("Favorite Pet")
    click_on('Number of Favorites:')

    expect(current_path).to eq('/favorites')

    expect(page).to have_content(mojo.name)
    expect(page).to have_css("img[src*='#{mojo.image}']")

    visit "/pets/#{lilly.id}"

    click_on("Favorite Pet")
    click_on('Number of Favorites:')

    expect(page).to have_content(mojo.name)
    expect(page).to have_css("img[src*='#{mojo.image}']")
    expect(page).to have_content(lilly.name)
    expect(page).to have_css("img[src*='#{lilly.image}']")
  end
end
