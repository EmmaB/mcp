module Connection
  module Philips

    def self.get(args)
      HTTParty.get(base_url + user, args)
    end

    def self.put(url, options = {})
      HTTParty.put(url_and_user + url, body: options.to_json)
    end

    private

    def self.base_url
      "http://192.168.1.132/api/"
    end

    def self.user
      "27945d281bb0e2dfed92d827513ecf"
    end

    def self.url_and_user
      self.base_url + self.user
    end
  end
end
