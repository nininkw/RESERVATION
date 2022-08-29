class RemoveDaysFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :Days, :integer
  end
end
