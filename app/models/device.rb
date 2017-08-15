class Device < ApplicationRecord

  # 192.168.1.105
  # 192.168.1.101
  # 192.168.1.102
  # 192.168.1.132
  USER = "27945d281bb0e2dfed92d827513ecf"


 def turn_on
   options = {"on":true}
   HTTParty.put("http://192.168.1.132/api/#{USER}/lights/3/state", body: options.to_json)
 end

 def turn_off
   options = {"on":false}
   HTTParty.put("http://192.168.1.132/api/#{USER}/lights/3/state", body: options.to_json)
 end

 def turn_yellow
   options = {"on":true, "hue":10000}
   HTTParty.put("http://192.168.1.132/api/#{USER}/lights/3/state", body: options.to_json)
 end

 def turn_green
   options = {"on":true, "hue":20000}
   HTTParty.put("http://192.168.1.132/api/#{USER}/lights/3/state", body: options.to_json)
 end


  def turn_blue
    options = {"on":true, "hue":30000}
    HTTParty.put("http://192.168.1.132/api/#{USER}/lights/3/state", body: options.to_json)
  end



end

#
# {"devicetype": "mcp#website emma"}
#
# [
# 	{
# 		"success": {
# 			"username": "27945d281bb0e2dfed92d827513ecf"
# 		}
# 	}
# ]
# user = "27945d281bb0e2dfed92d827513ecf"
# options = {"on":true}
# response = HTTParty.put("http://192.168.1.132/api/#{user}/lights/3/state", body: options.to_json)
