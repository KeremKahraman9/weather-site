require 'net/http'
class HomeController < ApplicationController
  def index
    apikey = Rails.application.secrets[:openweathermap_api_key]
    puts "*"*200
    puts apikey
    url = "https://api.openweathermap.org/data/2.5/weather?lat=41.0082&lon=28.9784&units=metric&appid=#{apikey}"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)

    @data = JSON.parse(res.body)
  end
end
