class LibrarianController < ApplicationController
	before_action :authenticate_librarian!
  def index
  	@user_books = UserBook.all
  	@user_book = UserBook.new
  end

  def lending_books
  	@user = User.find_by(reg_no: params[:user_book][:user][:reg_no])
  	@book = Book.find_by(isbn_no: params[:user_book][:book][:isbn_no])
  	@user_book = UserBook.new(user_id: @user.id, book_id: @book.id, date: Date.today + 10)
  	if @user_book.save
  		redirect_to librarian_path
  	end
  end
end
