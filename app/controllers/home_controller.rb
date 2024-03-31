require 'net/http'
class HomeController < ApplicationController
  def weather
    if request.post?
      session[:lat] = params[:lat]
      session[:lon] = params[:lon]

      lat = params[:lat]
      lon = params[:lon]
    else
      lat = session[:lat]
      lon = session[:lon]
    end

    if lat.present? && lon.present?
      apikey = Rails.application.secrets[:openweathermap_api_key]
      url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units=metric&appid=#{apikey}"
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      @data = JSON.parse(res.body)
    else
      @error = "Location data is missing."
    end
  end
end
