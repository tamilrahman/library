class User < ActiveRecord::Base
	validates :name, presence: true
	validates :reg_no, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	has_secure_password
	has_many :books, through: :user_books
	has_many :user_books
end
