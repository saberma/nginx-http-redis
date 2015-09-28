class ProductsController < ApplicationController
  caches_redis_page :index, :show, append_country: true

  def index
  end

  def update
    @product = Product.find(params[:id])
    @product.save
    redirect_to product_path(@product) and return
  end

  def show
    @product = Product.find(params[:id])
  end
end
