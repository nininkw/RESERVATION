class Reservation < ApplicationRecord
  validates :people, numericality: { greater_than_or_equal_to: 1, less_than: 100 }

  belongs_to :user
  belongs_to :room_post, optional: true

  validate :in_out_check

  private

  def in_out_check 
    if self.check_out < self.check_in
      errors.add :check_out, "はチェックイン以降の日にちを選択してください"
    end
  end
  
end
