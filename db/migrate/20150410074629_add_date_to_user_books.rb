class AddDateToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :date, :date
  end
end
