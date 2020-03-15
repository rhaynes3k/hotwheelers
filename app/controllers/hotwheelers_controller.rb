class HotwheelersController < ApplicationController

  # GET: /hotwheelers
  get "/hotwheelers" do
    erb :"/hotwheelers/index.html"
  end

  get "/hotwheelers/login" do
    erb :"/hotwheelers/login"
  end

  post "/hotwheelers/login" do
    hotwheeler = Hotwheeler.find_by(username: params[:username])
    session[:user_id] = hotwheeler.id
    redirect "/hotwheelers/#{hotwheeler.id}"
  end

  # GET: /hotwheelers/new
  get "/hotwheelers/new" do
    erb :"/hotwheelers/new"
  end

  # POST: /hotwheelers
  post "/hotwheelers" do
    @hotw = Hotwheeler.create(params)
    # binding.pry
    redirect "/hotwheelers/#{@hotw.id}"
  end

  # GET: /hotwheelers/5
  get "/hotwheelers/:id" do
    erb :"/hotwheelers/show"
  end

  # GET: /hotwheelers/5/edit
  get "/hotwheelers/:id/edit" do
    erb :"/hotwheelers/edit.html"
  end

  # PATCH: /hotwheelers/5
  patch "/hotwheelers/:id" do
    redirect "/hotwheelers/:id"
  end

  # DELETE: /hotwheelers/5/delete
  delete "/hotwheelers/:id/delete" do
    redirect "/hotwheelers"
  end
end
