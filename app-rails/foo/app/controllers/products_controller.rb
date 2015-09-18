class ProductsController < ApplicationController
  after_filter :save_cache_to_redis, only: :show

  def index
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    @model_name = Product.table_name
    @model_id = @product.id
  end
end
