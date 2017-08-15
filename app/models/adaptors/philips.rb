module Adaptors
  module Philips

    def self.on
      {"on":true}
    end

    def self.off
      {"on":false}
    end

    def self.yellow
      {"hue":10000}
    end

    def self.change_lights(id)
      "/lights/#{id}/state"
    end

  end
end
