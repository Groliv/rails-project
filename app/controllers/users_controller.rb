class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :giveRight, :indexbyuser]
	respond_to :html, :json

	def show
		@prods = @user.products.all
		@addresses = Addresse.where("user_id = ?", @user.id).all
		@addresse = Addresse.new
		@ratings = Rating.where({"ratable_id": @user.id, "ratable_type": User}).all
		@rating = Rating.new
		@biddings = Bidding.where({"user_id": @user.id})
		@bid = Bidding.new
	end

	def index
		@users = User.all
	end

	def giveRight
		p params.inspect
		@user.admin = true
		@user.save
		redirect_to @user
	end

	def indexbyuser
		@products = Product.where("products.user_id = ? ", @user.id).all
		redirect_to @user
	end

	def indexbycurrent
		@products = Product.where("products.user_id = ? ", current_user.id).all
		redirect_to current_user
	end


	private
	def set_user
		@user = User.find(params[:id])
	end
end