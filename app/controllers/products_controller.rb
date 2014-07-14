class ProductsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
  end

  def show

  end
end
