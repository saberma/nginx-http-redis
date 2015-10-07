class ProductsController < ApplicationController
  caches_redis_page :index, :show, append_country: true, unless: Proc.new { params[:preview] }

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

  def create
    @product = Product.create
    redirect_to products_path and return
  end
end
