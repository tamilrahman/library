module V1
	class BookAPI < ApplicationAPI
			get 'test' do
				Rails.logger.info "------------------#{@current_user.inspect}"
				success_response("check current_user")
			end

			get 'mybooks', rabl: 'mybooks.rabl' do
				@mybooks = @current_user.books
			end

			params do
				requires :book_id, type: Integer
			end
			post 'extend_date' do
				@book = Book.find(params[:book_id])
				@user_book = UserBook.find_by(book_id: @book.id, user_id: @current_user.id) 
				Rails.logger.info "------------------#{@user_book.inspect}"
				if @user_book.update(date: @user_book.date + 10)
					success_response("Book date is extended")
				else
					failure_response("Cann't be done")
				end
			end
	end	
end