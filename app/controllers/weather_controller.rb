require 'date'

class WeatherController < ApplicationController
  include HTTParty
  base_uri 'api.hgbrasil.com'

  def show
    city = params[:city]
    api_key = '757eaa52'
    response = self.class.get("/weather", query: { key: api_key, city_name: city })
    @weather = response.parsed_response['results']
    today = Date.today
    @date = today.strftime("%A, %B #{today.day.ordinalize}")

    # render json: @weather
  end
end
