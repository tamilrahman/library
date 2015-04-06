class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :reg_no
      t.string :password_digest
      t.string :name
      t.string :dept
      t.integer :year
      t.boolean :sign_flag

      t.timestamps null: false
    end
    add_index :users, :reg_no, unique: true
  end
end
