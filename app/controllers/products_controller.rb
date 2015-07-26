class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def indexbyuser
      @products = Product.where("products.user_id = ? ", user.id).all
  end

  def indexbycurrent
      @products = Product.where("products.user_id = ? ", current_user.id).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
      @ratings = Rating.where({"ratable_id": @product.id, "ratable_type": Product}).all
      @rating = Rating.new
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
  end

  # GET /products/1/edit
  def edit
      authorize @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    authorize @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    authorize @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    authorize @product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      if Product.where(:user_id => current_user.id).count == 0
        redirect_to user_url, flash: {:notice => "You have no product registered, create the first !"}
      else
        @product = Product.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:user_id, :title, :description, :price, :image_url)
    end
end
