class AddressesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_addresse, only: [:show, :edit, :update, :destroy]
	before_action :set_user_id, only: [:new, :create]

	def index
    	@addresses = Addresse.all
  	end

  	def show
  		@user = current_user
  		@addresses = Addresse.where("user_id = ?", @user.id).all
	end

	def new
		@addresse = Addresse.new
	end

	def edit
	end

	def create
		@addresse = Addresse.new(addr_params)
		@addresse.user_id = @user_id
		respond_to do |format|
    		if @addresse.save
        		format.html { redirect_to current_user, notice: 'Address was successfully created.' }
        		format.json { render :show, status: :created, location: current_user }
      		else
        		format.html { render :new }
        		format.json { render json: current_user.errors, status: :unprocessable_entity }
      		end
		end
	end

	def update
    	respond_to do |format|
      		if @addresse.update(addr_params)
        		format.html { redirect_to current_user, notice: 'Addresse was successfully updated.' }
        		format.json { render :show, status: :ok, location: current_user }
      		else
        		format.html { render :edit }
        		format.json { render json: current_user.errors, status: :unprocessable_entity }
      		end
    	end
  	end

	def destroy
		@addresse.destroy
		respond_to do |format|
      		format.html { redirect_to current_user, notice: 'Addresse was successfully destroyed.' }
      		format.json { head :no_content }
    	end
	end


	protected
    # Use callbacks to share common setup or constraints between actions.
    def set_addresse
      @addresse = Addresse.find(params[:id])
    end

    def set_user_id
      @user_id = current_user.id
    end

	def addr_params
  		params.require(:addresse).permit(:typeAddresse, :number, :street, :zipcode, :city, :country)
	end
end

