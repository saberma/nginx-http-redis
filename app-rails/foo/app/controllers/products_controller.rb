class ProductsController < ApplicationController
  after_filter :save_cache_to_redis, only: [:index, :show]
  after_filter :set_csrf_cookie, only: :show

  def index
  end

  def update
    @product = Product.find(params[:id])
    @product.save
    redirect_to product_path(@product) and return
  end

  def show
    @product = Product.find(params[:id])
    @model_name = Product.table_name
    @model_id = @product.id
  end
end
