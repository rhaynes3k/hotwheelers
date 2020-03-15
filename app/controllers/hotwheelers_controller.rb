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

  get "/hotwheelers/logout" do
    session.clear
    redirect "/hotwheelers/login"
  end

  # GET: /hotwheelers/5
  get "/hotwheelers/:id" do
    @hotw = Hotwheeler.find(params[:id])
    # binding.pry
    erb :"/hotwheelers/show"
  end

  get "/hotwheelers/:id/edit" do
      @hotw = Hotwheeler.find(params[:id])

      erb :"/hotwheelers/edit"
    end

  patch "/hotwheelers/:id" do

      @hotw = Hotwheeler.find(params[:id])

      @hotw.update(name: params[:name], age: params[:age], username: params[:username])
      redirect "/hotwheelers/#{@hotw.id}"
    end

    delete "/hotwheelers/:id" do
      @hotw = Hotwheeler.find(params[:id])
      @hotw.destroy
      redirect "/hotwheelers/login"
    end

end
