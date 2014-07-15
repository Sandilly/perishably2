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
    @products = Product.search(params[:search])
    if @products == []
      redirect_to root_path, :notice => "Product not found. Please try again."
    else
      render :index
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)

    if @product.save
      redirect_to root_path(@product)
    else
      redirect_to edit_product_path
    end
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
