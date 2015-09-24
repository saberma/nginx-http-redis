class SessionsController < ApplicationController
  after_filter :set_csrf_cookie

  def status
    render nothing: true
  end

  private
  def set_csrf_cookie
    if protect_against_forgery?
      cookies[:csrf_token] = form_authenticity_token
    end
  end
end
