class Category < ActiveRecord::Base
	has_many :books, through: :book_categories
	has_many :book_categories
end
