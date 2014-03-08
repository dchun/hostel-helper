class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :price, :precision => 7, :scale => 2
      t.integer :quantity
      t.string :name
      t.text :description
      t.string :image
      t.integer :max_bookable
      t.integer :max_days_before
      t.string :payment_method
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
