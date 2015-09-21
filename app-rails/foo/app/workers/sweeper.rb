class Sweeper
  include Sidekiq::Worker

  def perform(url)
    uri = URI(url)
    uri.port = 8081

    auth = { username: "cache", password: "ewHN84JZLyRurX" }

    Rails.logger.info "running sweeper job: #{url}"
    response = HTTParty.get(uri, basic_auth: auth)
    #Rails.logger.info "response: #{response.body}"
  end
end
