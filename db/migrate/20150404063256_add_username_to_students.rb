class AddUsernameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :reg_number, :integer
    add_index :students, :reg_number, unique: true
  end
end
