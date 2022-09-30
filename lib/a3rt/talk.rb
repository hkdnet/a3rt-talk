require "a3rt/talk/version"
require "a3rt/talk/result"
require "a3rt/talk/response"

require 'net/https'
require 'json'

module A3rt::Talk
  ENDPOINT = "https://api.a3rt.recruit.co.jp/talk/v1/smalltalk".freeze

  class << self
    def authorize!(api_key)
      Thread.current[:a3rt_talk_api_key] = api_key
    end

    def api_key
      Thread.current[:a3rt_talk_api_key]
    end

    def talk(query, api_key = A3rt::Talk.api_key)
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data({ 'query' => query, 'apikey' => api_key })
      res = http.request(req)
      data = JSON.parse(res.body)
      Response.new(data)
    end

    private

    def uri
      @uri ||= URI.parse(ENDPOINT)
    end

    def http
      @http ||=
        Net::HTTP.new(uri.host, uri.port).tap do |e|
          e.use_ssl = true
          e.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
    end
  end
end
