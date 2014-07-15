class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path(@products)
    else 
      redirect_to new_product_path
    end
  end

  def index
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def show
    @product = Product.find(params[:id])

  end

  private

  def product_params
    params.require(:product).permit(:name, :expiration_date)
  end
end
