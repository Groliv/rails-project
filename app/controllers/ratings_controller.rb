class RatingsController < ApplicationController
   before_action :set_rating, only: [:avgrate, :index, :show, :edit, :update, :destroy]

  def _index
    @context = context
    @ratings = Rating.where("ratable_id = ?", @context.id && "ratable_type = ?", @context.type).all
  end

  def show
  end

  def new
    @context = context
    @rating = @context.ratings.new
    authorize @rating
  end

  def create
    @context = context
    @rating = @context.ratings.new(rating_params)
    @rating.user = current_user
    authorize @rating

    if @rating.save
      redirect_to context_url(context), notice: "The notice has been successfully created."
    end
  end

  def edit
    authorize @rating
  end

  def update
      authorize @rating
      @context = context
      respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to context_url(context), notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def rating_params
    params.require(:rating).permit!
  end

  def context
    if params[:user_id]
      id = params[:user_id]
      type = 'User'
      User.find(params[:user_id])
    else
      id = params[:product_id]
      type = 'Product'
      Product.find(params[:product_id])
    end
  end 

  def context_url(context)
    if User === context
      user_path(context)
    else
      product_path(context)
    end
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
