class RemoveTotalFeeFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :Total_fee, :integer
  end
end
