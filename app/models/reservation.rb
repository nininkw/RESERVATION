class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room_post

end
