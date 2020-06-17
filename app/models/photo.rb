class Photo < ApplicationRecord
  belogs_to :user

  attachment :image
end
