class WeatherController < ApplicationController
  include HTTParty
  base_uri 'api.hgbrasil.com'

  def show
    city = params[:city] 
    api_key = '2ca29349' 
    response = self.class.get("/weather", query: { key: api_key, city_name: city })
    @weather = response.parsed_response

    render json: @weather
  end
end
