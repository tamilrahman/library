class CreateBookRepositories < ActiveRecord::Migration
  def change
    create_table :book_repositories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
