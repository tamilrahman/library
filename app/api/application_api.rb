class ApplicationAPI < Grape::API
	format :json
	formatter :json, Grape::Formatter::Rabl

	mount V1::Base

	get 'test' do
    {
      status: true,
      message: "available"
    }
  end
end