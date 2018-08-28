class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception

	# Forces user to authenticate
	before_action :authenticate_user!
end
