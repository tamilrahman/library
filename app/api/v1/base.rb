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
		end
		mount UserAPI
		
		get 'test' do
			
		end
	end
end