module V1
	class UserAPI < ApplicationAPI

		resource :user do 
			desc "Create a new user"
			params do
				requires :reg_no, type: Integer
				requires :password, type: String
				requires :name, type: String
				requires :dept, type: String
				requires :year, type: Integer
			end
			post 'new' do
				@user = User.find_by(reg_no: params[:reg_no])
				if !@user
					user = User.create(
						reg_no: params[:reg_no],
	      		password: params[:password],
	      		name: params[:name],
	      		dept: params[:dept],
	      		year: params[:year])

					success_response("Successfully Registered")
				else
					failure_response("User Already Exists")
				end
			end
		end
	end
end