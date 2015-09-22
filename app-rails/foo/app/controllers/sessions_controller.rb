class SessionsController < ApplicationController
  after_filter :set_csrf_cookie

  def status
    render nothing: true
  end
end
