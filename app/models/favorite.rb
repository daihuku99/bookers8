class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :book_image
end
