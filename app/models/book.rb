class Book < ActiveRecord::Base
	belongs_to :student
	has_many :authors, through: :book_authors
	has_many :categories, through: :book_categories
end
