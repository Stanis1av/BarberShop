class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.reference :service, null: false, foreign_key: true
      t.string :location, null: false, foreign_key: true
      t.reference :service, null: false, foreign_key: true
      t.string :hairdresser
      t.references :service
      t.datetime :dateandtime
      t.string :phone_num
      t.text :note

      t.timestamps
    end
  end
end
