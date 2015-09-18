class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def save_cache_to_redis
    Rails.logger.info "uri: #{request.url}; path: #{request.path}"
    #we just use set here now
    $redis.set( request.path, response.body )

    #just like before
    if @model_name
      $redis.sadd("i:#{@model_name.downcase}:#{@model_id}", request.url)
    end
  end
end
