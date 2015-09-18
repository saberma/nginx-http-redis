class Product < ActiveRecord::Base
  after_save :invalidate_instance_cache

  def invalidate_instance_cache
    $redis.smembers("i:#{self.class.table_name}:#{self.id}").each do |url|
      Rails.logger.info "add sweeper job: #{url}"
      Sweeper.perform_async(url)
    end
  end
end
