class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  after_save :reverse_geolocate

  def reverse_geolocate
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng="
    url += latitude.to_s + "," + longitude.to_s
    url += "&key=" + "AIzaSyDl0lv9ZzRInR6zFYJp19TPC08ggQWS9HQ"
    uri = URI.parse(url)
    puts uri
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    puts JSON.parse(response)
    puts "/////////////////////////////////////////////////////////////"
    # save this shit to the pin in db
  end
end
