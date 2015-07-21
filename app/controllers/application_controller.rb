class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_filter :configure_permitted_parameters, if: :devise_controller?

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	respond_to :html, :json

	def after_sign_in_path_for(resource)
  		user_path(current_user)
	end

	def after_sign_out_path_for(resource_or_scope)
  		request.referrer
	end

	protected 
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :firstname , :lastname , :addresses_attributes => [:number, :street, :zipcode, :city, :country])}
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :firstname , :lastname , :addresses_attributes => [:number, :street, :zipcode, :city, :country])}
	end

end

