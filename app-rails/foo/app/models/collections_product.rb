class CollectionsProduct < ActiveRecord::Base
  belongs_to :collection, touch: true
  belongs_to :product
end
