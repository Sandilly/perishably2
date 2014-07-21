class ProductsController < ApplicationController
  before_action :login_required

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name:params[:product][:name])
    # @product.time = 
    if @product.save
      render :new, notice: "Item added"
      redirect_to product_path(@product) 
      #should flash"product added" and go to the user's products page
    else 
      render :new, notice: "Try again."
    end

  end

  def index
    @products = Product.all
    
    respond_to do |format|
      format.html
      format.json {render json: @products}
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)

    if @product.save
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def show

    @product = Product.find(params[:id])
  end

  def search 
    @product = Product.find_by(name: params[:name])
    respond_to do |format|
      format.json {render json: @product}
    end
  end
  private

  def product_params
    params.require(:product).permit(:name, :time, :storage)
  end

end
