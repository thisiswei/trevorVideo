require 'net/http'

class Pinger 
  class << self
    def perform
      host = 'trevorvideo.herokuapp.com'
      url  = Rails.application.routes.url_helpers.root_url(host: host)
      Net::HTTP.get_response(URI.parse(url))
    end
  end
end
