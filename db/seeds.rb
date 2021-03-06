# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create!(name:       "Shelters 'r Us",
                     address:       "1042 N Marion St",
                     city:          "Denver",
                     state:         "Colorado",
                      zip:          "80218")

shelter_2 = Shelter.create!(name:       "My Other Shelter",
                     address:       "15580 Quorum Dr",
                     city:          "Dallas",
                     state:         "Texas",
                      zip:          "75001")

lola = Pet.create!(image: "pets/lab.jpg",
           name: "Lola",
           description: "Best Dawg in the world",
           age: "4",
           sex: "Female",
           shelter_id: shelter_1.id,
           adopted: "Adoptable"
           )

jamie = Pet.create!(image: "pets/golden.jpg",
            name: "Jamie Lannister",
            description: "of royal descent",
            age: "79",
            sex: "Male",
            shelter_id: shelter_2.id,
            adopted: "Adoptable"
            )

lilly = Pet.create!(image: "pets/lilly.jpeg",
                    name: "Lilly Gaddis",
                    description: "of royalest descent",
                    age: "4",
                    sex: "Female",
                    shelter_id: shelter_2.id,
                    adopted: "Adoptable"
                        )

review1 = Review.create(
    title: "Good Shelter",
    rating: 5,
    content: "Fantastic staff and cleanily area for animals.",
    picture: "https://i.pinimg.com/474x/8b/f4/d4/8bf4d4c3062e2f1b719d2b9c22b671ab--dog-boarding-kennels-dog-kennels.jpg",
    shelter_id: shelter_1.id
    )
