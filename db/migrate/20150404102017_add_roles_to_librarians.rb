class AddRolesToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :role, :string
  end
end
