class ProductsController < ApplicationController
  after_filter :save_cache_to_redis

  def index
  end

  def show
    product = Product.find(params[:id])
    @model_name = Product.table_name
    @model_id = product.id
    render text: "#{product.id} #{DateTime.now.to_s(:db)}"
  end
end
