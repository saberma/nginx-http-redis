class HomeController < ApplicationController
  caches_redis_page :page

  def page
  end

  def missing
    render text: 'missing'
  end
end
