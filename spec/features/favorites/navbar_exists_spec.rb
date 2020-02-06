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

    it "I can click the favorite indicator and be taken to the favorites index page." do
        visit '/'

        click_on('Number of Favorites:')

        expect(current_path).to eq('/favorites')
        save_and_open_page
    end
end

# As a visitor
# When I click on the favorite indicator in the nav bar
# I am taken to the favorites index page

