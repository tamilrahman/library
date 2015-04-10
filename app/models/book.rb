class Book < ActiveRecord::Base
	has_many :users, through: :user_books
	has_many :user_books
	has_many :authors, through: :book_authors
	has_many :book_authors
	has_many :categories, through: :book_categories
	has_many :book_categories
	accepts_nested_attributes_for :authors
	accepts_nested_attributes_for :categories
end
