class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	include Pundit
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
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :firstname , :lastname, :addresses_attributes => [:typeAddresse, :number, :street, :zipcode, :city, :country] )}
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password,  :firstname , :lastname,:addresses_attributes => [:typeAddresse, :number, :street, :zipcode, :city, :country])}
	end

	private
	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path)
	end

end

