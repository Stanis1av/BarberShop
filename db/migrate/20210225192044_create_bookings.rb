class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :location, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true
      t.references :hairdressers, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.datetime :dateandtime
      t.string :phone_num
      t.text :note

      t.timestamps
    end
  end
end
