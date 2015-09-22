class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def save_cache_to_redis
    Rails.logger.info "uri: #{request.url}; path: #{request.path}"
    $redis.set( request.path, response.body )

    #just like before
    if @model_name
      mark_cache_instance(@model_name, @model_id)
    end
  end

  protected
  # http://stackoverflow.com/a/15056471
  def verified_request?
    # Rails.logger.info cookies[:csrf_token]
    super || form_authenticity_token == cookies[:csrf_token]
  end

  def set_csrf_cookie
    if protect_against_forgery?
      cookies[:csrf_token] = form_authenticity_token
    end
  end
end
