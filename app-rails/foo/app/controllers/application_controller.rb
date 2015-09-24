class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  # http://stackoverflow.com/a/15056471
  def verified_request?
    # Rails.logger.info cookies[:csrf_token]
    super || form_authenticity_token == cookies[:csrf_token]
  end
end
