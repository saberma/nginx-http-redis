class HomeController < ApplicationController
  caches_page :page

  def page
  end

  def missing
    render text: 'missing'
  end
end
