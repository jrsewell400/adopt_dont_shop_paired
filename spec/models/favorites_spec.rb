require 'rails_helper'

RSpec.describe Favorite do
  describe "total_count" do
    it "can calculate the total number of favorites it holds" do
      # require "pry"; binding.pry
      favorites = Favorite.new({
        1 => 1,
        2 => 3
      })
      expect(favorites.total_count).to eq(4)
    end
  end
end
