class HomeController < ApplicationController
  def page
    redirect_to products_path
  end

  def missing
    render text: 'missing'
  end
end
