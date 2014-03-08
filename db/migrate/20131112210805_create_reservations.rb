class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :arrival
      t.date :departure
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.integer :quantity
      t.belongs_to :beds, index: true

      t.timestamps
    end
  end
end
