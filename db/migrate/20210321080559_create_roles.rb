class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :var_name
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
