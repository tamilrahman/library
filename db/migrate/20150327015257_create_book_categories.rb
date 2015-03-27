class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.integer :category_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
