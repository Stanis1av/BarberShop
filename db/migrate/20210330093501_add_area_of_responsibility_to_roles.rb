class AddAreaOfResponsibilityToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :type_area, :string, default: "not"
  end
end
