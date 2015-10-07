class CreateCollectionsProducts < ActiveRecord::Migration
  def change
    create_table :collections_products do |t|
      t.integer :collection_id
      t.integer :product_id

      t.timestamps
    end
  end
end
