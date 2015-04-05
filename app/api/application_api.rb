class ApplicationAPI < Grape::API
	format :json
	formatter :json, Grape::Formatter::Rabl

	get 'test' do
      {
        status: true,
        message: "available"
      }
  end
	
end