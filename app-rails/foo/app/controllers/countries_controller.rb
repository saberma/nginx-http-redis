class CountriesController < ApplicationController
  def change
    cookies[:country] = %w(US CA CN JP).sample
    Rails.logger.info "[page cache]country: #{cookies[:country]}"
    redirect_to :back
  end
end
