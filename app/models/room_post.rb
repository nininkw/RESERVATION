class RoomPost < ApplicationRecord
  belongs_to :user
  has_many :reservations

  mount_uploader :room_img, ImageUploader
  
end 
 