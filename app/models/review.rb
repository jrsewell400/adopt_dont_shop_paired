class Review < ApplicationRecord

  validates_presence_of :title, :content, :rating, :picture
end