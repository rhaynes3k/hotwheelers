require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    erb :"/hotwheelers/login"
  end

  post "/login" do
    hotwheeler = Hotwheeler.find_by(username: params[:username])
    session[:user_id] = hotwheeler.id
    # binding.pry
    redirect "/cars/"
  end

  get "/logout" do
    session[:user_id] = nil
    redirect "/"
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

  end


end
