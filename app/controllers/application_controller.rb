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
    hotwheeler.authenticate(params[:password])
    session[:user_id] = hotwheeler.id
    redirect "/hotwheelers/#{hotwheeler.id}"
  end

  get "/logout" do
    session[:user_id] = nil
    redirect "/"
  end

  helpers do

    def logged_in?
      !!current_user
    end

  end


    def current_user
      @current_user ||= Hotwheeler.find_by(id: session[:user_id])
    end

end
