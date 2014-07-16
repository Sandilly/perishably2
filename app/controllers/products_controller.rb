class ProductsController < ApplicationController
  before_action :login_required

  #for the autofill





  #end of for the autofill

  def new
    @product = Product.new
  end

  def create
    @product = Product.find_by_name(params[:product][:name])
    if @product.save
      redirect_to product_path(@product)
    else 
      redirect_to products_path
    end
  end


  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     redirect_to root_path(@products)
  #   else 
  #     redirect_to new_product_path
  #   end
  # end

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

<<<<<<< HEAD
  def product_params
    params.require(:product).permit(:name, :time, :storage)
  end
=======
  # def product_params
  #   params.require(:product).permit(:name, :expiration_date)
  # end
>>>>>>> search and autofill bar now redirect to show page for pre-existing product
end
