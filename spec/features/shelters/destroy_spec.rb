require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do

  it "can delete individual shelters" do
    shelter_1 = Shelter.create(name: "Shelters 'r Us",
      address: "1042 N Marion St",
      city: "Denver",
      state: "Colorado",
      zip: "80218"
    )

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    click_on("Delete")
    have_current_path "/shelters"
    expect(page).to_not have_content('This is a Shelter')
  end

  it "If a shelter has pets with approved applications it can not be deleted" do

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
      adopted: "Adoptable",
      shelter_id: @shelter_1.id)

      @mojo = Pet.create(image: "https://files.brief.vet/2019-07/pelvic-limb_HEADER.png",
        name: "Mojo Jojo",
        description: "Annoying little chomper",
        age: "40",
        sex: "Female",
        adopted: "Adoptable",
        shelter_id: @shelter_1.id)

      @harry = Pet.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/31131032/Golden-Retriever-Puppy-Harry-Potter.jpg",
          name: "Harry Potter",
          description: "The Boy Who Lived",
          age: "12",
          sex: "Male",
          adopted: "Adoptable",
          shelter_id: @shelter_2.id)

      @review1 = Review.create(title: "Good Shelter",
            rating: 5,
            content: "Fantastic staff and cleanily area for animals.",
            picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
            shelter_id: @shelter_1.id
          )

      @review2 = Review.create(title: "Wags a Lot",
            rating: 3,
            content: "Waggy fun for everyone!",
            picture: "https://www.okhumane.org/wp-content/uploads/2019/02/Aerial-view-from-the-south-looking-north-towards-OHS-Scissortail-Park-and-the-city-skyline-400x225.jpg",
            shelter_id: @shelter_1.id
          )

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
                pet_id: @lilly.id)

      @pet_app2 = ApplicationPet.create(application_id: @app1.id,
                  pet_id: @mojo.id)

      @pet_app3 = ApplicationPet.create(application_id: @app2.id,
                    pet_id: @mojo.id)
    visit '/shelters'
    within "#shelter-#{@shelter_1.id}" do
      expect(page).to_not have_content("Delete")
    end
    within "#shelter-#{@shelter_2.id}" do
      expect(page).to have_button("Delete")
    end
  end
end
