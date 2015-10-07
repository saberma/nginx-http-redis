class Collection < ActiveRecord::Base
  include RedisPage::Sweeper

  has_many :collections_products, dependent: :destroy
  # @collection.products.delete @product 删除与商品的关联记录后，after_remove 可以保证 collection 得到更新
  has_many :products, through: :collections_products, after_remove: proc { |a| a.touch }
end
