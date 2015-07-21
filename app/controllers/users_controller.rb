class UsersController < ApplicationController
	def show
  		@user = User.find(params[:id])
  		@addresses = Adresse.where("type = ? AND user_id = ?", type, @user.id).all
	end

	def index
  		@users = User.all
	end

end
