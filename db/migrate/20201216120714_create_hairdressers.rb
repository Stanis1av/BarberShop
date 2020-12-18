class CreateHairdressers < ActiveRecord::Migration[6.0]
  def change
    create_table :hairdressers do |t|
      t.string :first_name
      t.string :last_name
      t.text :description

      t.timestamps
    end
  end
end
