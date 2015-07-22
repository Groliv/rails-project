class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show]
	respond_to :html, :json

	def show
  		@addresses = Addresse.where("user_id = ?", @user.id).all
  		@addresse = Addresse.new
	end

	def index
  		@users = User.all
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
