class HomeController < ApplicationController
  after_filter :save_cache_to_redis, only: :page

  def page
  end

  def missing
    render text: 'missing'
  end
end
