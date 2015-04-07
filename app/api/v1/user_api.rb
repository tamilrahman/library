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

			desc "Login to Account"
			params do
				requires :reg_no, type: Integer
				requires :password, type: String
				requires :device_id, type: String
			end
			post 'login' do
				@user = User.find_by(reg_no: params[:reg_no])
				if !@user
					failure_response("Register number or Password incorrect")
				else
					if @user.authenticate(params[:password])
						@user.update(sign_flag: true, device_id: params[:device_id])
						set_current_user(params[:device_id])
						Rails.logger.info "------------------#{@current_user.inspect}"
						success_response("User Successfully Logged in")
					else
						failure_response("Register Number or Password Incorrect")
					end
				end
			end
			before do
				set_current_user(params[:device_id])
			end
			get ':device_id/test_user' do
				Rails.logger.info "------------------#{@current_user.inspect}"
				success_response("check current_user")
			end
		end
	end
end