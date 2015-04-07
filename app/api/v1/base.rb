module V1
	class Base < ApplicationAPI
		version "v1", using: :path

		helpers do
			def success_response(message)
		    {
		      status: true,
		      message: message
		    }
	  	end

		  def failure_response(message)
		    {
		      status: false,
		      message: message
		    }
		  end

			def set_current_user(device_id)
				@current_user ||= User.find_by(device_id: device_id)
			end

			def authorize!
				if !@current_user
					error!(failure_response("User not authorized"))
				end
			end
		end
		mount UserAPI
	end
end