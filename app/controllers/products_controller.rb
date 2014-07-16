class ProductsController < ApplicationController
  before_action :login_required

  #for the autofill
  def product_name
    Product.try(:name)
  end
  def category_name=(name)
    self.product = Product.find_or_create_by_name(name) if name.present?
  end
  


  #end of for the autofill

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else 
      render :new
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

  private

  def product_params
    params.require(:product).permit(:name, :time, :storage)
  end
end
