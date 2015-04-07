module V1
	class BookAPI < ApplicationAPI
			get 'test' do
				Rails.logger.info "------------------#{@current_user.inspect}"
				success_response("check current_user")
			end

			get 'mybooks', rabl: 'mybooks.rabl' do
				@mybooks = @current_user.books
			end
	end	
end