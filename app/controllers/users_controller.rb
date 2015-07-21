class UsersController < ApplicationController
	before_action :authenticate_user!
	respond_to :html, :json

	def newAddr
		@addr.user_id = current_user.id
		@addr.update_attributes(addr_params)
		@addr.save
	end
	helper_method :newAddr

	def deleteAddr
		@addr = Adresses.findById(Adresses.id)
		@addr.destroy
	end
	helper_method :deleteAddr

	def editAddr
		@addr = Adresses.findById(Adresses.id)
		@addr.update
	end
	helper_method :editAddr

	def show
  		@user = User.find(params[:id])
  		@addresses = Addresse.where("user_id = ?", @user.id).all
  		@addr = Addresse.new
	end

	def toto
		"TOTO"
	end
	helper_method :toto

	def index
  		@users = User.all
	end

	private
	def addr_params
  		params.permit([:user_id, :typeAddresse, :number, :street, :zipcode, :city, :country])
	end

end
