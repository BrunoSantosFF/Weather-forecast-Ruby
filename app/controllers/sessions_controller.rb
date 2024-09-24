  class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to weather_new_path  # Redireciona para a ação new do WeatherController
      else
        flash.now[:alert] = 'Email ou senha inválidos'
        render :new
      end
    end

    def show
      @user = User.find(session[:user_id])
      @search_histories = SearchHistory.where(user_id: @user.id).order(searched_at: :desc)
    end

    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end
  end
