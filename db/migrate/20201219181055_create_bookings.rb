class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      #t.string :location
      #t.string :hairdresser
      #t.string :service
      t.datetime :dateandtime
      t.string :phone_num
      t.text :note

      t.timestamps
    end
  end
end
