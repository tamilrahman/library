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
				Rails.logger.info "------------------#{@user}"
				if !@user
					failure_response("Register number or Password incorrect")
				else
					if @user.authenticate(params[:password])
						@user.update(sign_flag: true, device_id: params[:device_id])
						Rails.logger.info "------------------#{@current_user.inspect}"
						success_response("User Successfully Logged in")
					else
						failure_response("Register Number or Password Incorrect")
					end
				end
			end

			params do
				requires :device_id, type: String
			end
			delete 'logout' do
				@user = User.find_by(device_id: params[:device_id])
				if !@user
					failure_response("User not authendicated")
				else
					if @user.sign_flag?
						@user.update(sign_flag: false, device_id: nil)
						success_response("User successfully logged out")
					else
						failure_response("User not authendicated")
					end
				end
			end


			before do
				set_current_user(params[:device_id])
			end
			resource ':device_id' do
				# Rails.logger.info "------------------#{@current_user.inspect}"
				# success_response("check current_user")
			end
		end
	end
end