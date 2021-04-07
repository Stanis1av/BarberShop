class AddReferenceLocationToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_reference :users, :location, foreign_key: true, default: ''
  end
end
