class RenameReservationBedsIdToBedId < ActiveRecord::Migration
  def change
    rename_column :reservations, :beds_id, :bed_id
  end
end
