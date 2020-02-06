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
    end
end