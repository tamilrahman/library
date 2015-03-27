class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.integer :author_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
