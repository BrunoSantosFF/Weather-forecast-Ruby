require 'date'

class WeatherController < ApplicationController
  include HTTParty

  before_action :require_login

  base_uri 'api.hgbrasil.com'

  def show
    city = params[:city]
    api_key = '757eaa52'
    response = self.class.get("/weather", query: { key: api_key, city_name: city })
    @weather = response.parsed_response['results']
    today = Date.today
    @date = today.strftime("%A, %B #{today.day.ordinalize}")

    possible_conditions = {
      'clear_day' => 'sun',
      'clear_night' => 'sun',
      'cloud' => 'wind',
      'cloudly_day' => 'wind',
      'cloudly_night' => 'wind',
      'rain' => 'rain',
      'storm' => 'storm',
      'snow' => 'snow',
      'hail' => 'snow',
      'fog' => 'wind',
      'none_day' => 'sun',
      'none_night' => 'sun'
    }

    @condition = possible_conditions[@weather['condition_slug']]

    # render json: @weather
  end

  private

    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end

    def logged_in?
      !!session[:user_id]
    end
end
