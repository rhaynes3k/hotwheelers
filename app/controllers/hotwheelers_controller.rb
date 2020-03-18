class HotwheelersController < ApplicationController

  # GET: /hotwheelers
  get "/hotwheelers" do
    @hotw = Hotwheeler.all

    if session[:user_id] = current_user.id
      binding.pry
    erb :"/hotwheelers/index"
    else
      redirect "/login"
    end
  end



  # GET: /hotwheelers/new
  get "/hotwheelers/new" do
    erb :"/hotwheelers/new"
  end

  # POST: /hotwheelers
  post "/hotwheelers" do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
    @hotw = Hotwheeler.create(params)
    session[:user_id] = params[:user_id]
    redirect "/hotwheelers"
    else
      redirect "/login"
    end

  end

  delete "/hotwheelers/:id" do
    @hotw = Hotwheeler.find(params[:id])
    @hotw.destroy
    redirect "/login"
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



end
