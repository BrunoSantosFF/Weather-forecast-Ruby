class ApiConsumerController < ApplicationController
  require 'httparty'

  def show
    response = HTTParty.get('https://api.github.com/users/octocat')

    if response.success?
      @user_info = response.parsed_response
    else
      @error_message = "Erro ao tentar acessar a API"
    end
  end
end
