class HomeController < ApplicationController
  after_filter :save_cache_to_redis

  def page
  end
end
