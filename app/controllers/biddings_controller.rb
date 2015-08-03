class BiddingsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_bidding, only: [:show, :edit, :update, :destroy]

	def index
		@biddings = Bidding.all
	end

	def show	
	end

	def new
		@product = Product.find(params[:product_id])
		@bidding = Bidding.new
		authorize @bidding
		puts @bidding
	end


	def create
		@bidding = Bidding.new(bidding_params)
		authorize @bidding
		@product = Product.find(params[:product_id])
		@bidding.user = current_user
		@bidding.product = @product
		if @bidding.amount == nil && @bidding.product.autobidded?
			@bidding.product.autobid
		end
		if @bidding.amount != nil && @bidding.amount > @bidding.product.price
			@bidding.product.price = @bidding.amount
		else
			redirect_to @bidding.product, alert: "You must set a bidding price or select autobidding !"
			return 
		end
		puts @bidding.amount
		respond_to do |format|
			if @bidding.save
				format.html { redirect_to product_path(@product), notice: 'Your bidding was successfully registered.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @bidding.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@bidding.destroy	
	end


	private
	def set_bidding
		@bid = Bidding.find(params[:id])
	end

	def bidding_params
		params.require(:bidding).permit!
	end

end
