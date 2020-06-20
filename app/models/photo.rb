class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_comments, dependent: :destroy
  has_many :photo_favorites, dependent: :destroy

  attachment :image
end
