class HotwheelersController < ApplicationController

  # GET: /hotwheelers

  get "/hotwheelers" do
    if logged_in?
    @hotw = Hotwheeler.all
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
    session[:user_id] = @hotw.id
    redirect "/hotwheelers"
    else
      redirect "/login"
    end

  end

  delete "/hotwheelers/:id" do
    if logged_in?
      @hotw = Hotwheeler.find(params[:id])
      @hotw.destroy
      redirect "/login"
    end

  end

  # GET: /hotwheelers/5
  get "/hotwheelers/:id" do
    if logged_in?
    @hotw = Hotwheeler.find(params[:id])
    erb :"/hotwheelers/show"
    else
      redirect "/login"
    end

  end

  get "/hotwheelers/:id/edit" do
      @hotw = Hotwheeler.find(params[:id])
    if @hotw.id == current_user.id
      erb :"/hotwheelers/edit"
    else
      redirect "/login"
    end

  end

  patch "/hotwheelers/:id" do
      @hotw = Hotwheeler.find(params[:id])

      if @hotw.id == current_user.id
        @hotw.update(name: params[:name], age: params[:age], username: params[:username], password: params[:password])
        redirect "/hotwheelers/#{@hotw.id}"
      else
        redirect "/hotwheelers/#{@hotw.id}/edit"
      end

    end



end
