class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory && product.inventory > 0 ? true : false
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
   @product = Product.create(product_params)
   redirect_to products_path
 end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
