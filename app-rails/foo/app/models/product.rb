class Product < ActiveRecord::Base
  include RedisPage::Sweeper
end
