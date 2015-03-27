class Author < ActiveRecord::Base
	has_many :books, through: :book_authors
end
