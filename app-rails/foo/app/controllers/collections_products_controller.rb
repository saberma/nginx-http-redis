class CollectionsProductsController < ApplicationController
  def create
    @collection = Collection.find_by_slug(:accessories)
    @product = Product.find(params[:product_id])
    @collection.products << @product
    redirect_to products_path and return
  end

  def destroy
    @collection = Collection.find_by_slug(:accessories)
    @product = Product.find(params[:product_id])
    @collection.products.delete @product
    redirect_to products_path and return
  end
end
