class ApiConsumerController < ApplicationController
  require 'httparty'

  def show
    # Fazer a requisição à API
    response = HTTParty.get('https://api.github.com/users/octocat')

    # Verificar se a resposta foi bem-sucedida
    if response.success?
      @user_info = response.parsed_response
    else
      @error_message = "Erro ao tentar acessar a API"
    end
  end
end
