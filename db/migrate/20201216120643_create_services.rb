class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name_service
      t.text :description
      t.integer :price
      t.time :time_service

      t.timestamps
    end
  end
end
