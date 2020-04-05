class HotwheelersController < ApplicationController

  get "/hotwheelers" do
    if logged_in?
      @hotw = Hotwheeler.all
      erb :"/hotwheelers/index"
    else
      redirect "/login"
    end
  end

  get "/hotwheelers/new" do
    erb :"/hotwheelers/new"
  end

  post "/hotwheelers" do
    @hotw = Hotwheeler.create(params)
    if @hotw.valid?
      session[:user_id] = @hotw.id
      redirect "/hotwheelers"
    else
      redirect '/hotwheelers/new'
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
#       if params[:password].blank?
# params.delete(:password)
# end

      @hotw.update(name: params[:name], age: params[:age].to_i, username: params[:username], password: params[:password])

      redirect "/hotwheelers/#{@hotw.id}"
    else
      redirect "/hotwheelers/#{@hotw.id}/edit"
    end
  end

  delete "/hotwheelers/:id" do
    if logged_in?
      @hotw = Hotwheeler.find(params[:id])
      @hotw.destroy
      redirect "/login"
    end
  end

  get "/hotwheelers/:id" do
    if logged_in?
      @hotw = Hotwheeler.find(params[:id])
      erb :"/hotwheelers/show"
    else
      redirect "/login"
    end
  end

end
