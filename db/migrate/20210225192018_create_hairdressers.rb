class CreateHairdressers < ActiveRecord::Migration[6.0]
  def change
    create_table :hairdressers do |t|
      t.string :name
      t.string :position
      t.string :description
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
