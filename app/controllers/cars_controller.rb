class CarsController < ApplicationController

  get "/cars" do
    if logged_in?
      @cars = Car.all
      erb :"/cars/index"
    else
      redirect "/login"
    end
  end

  get "/cars/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :"/cars/new"
    end
  end

  post "/cars" do
    if !logged_in?
      redirect "/login"
    else

      @car = Car.new(year: params[:year], make: params[:make], model: params[:model], color: params[:color], rank: params[:rank], hotwheeler_id: current_user.id)
      if @car.save
        redirect "/cars/#{@car.id}"
      else
        redirect "/cars/new"
      end

    end
  end

  get "/cars/:id" do
    if logged_in?
      @car = Car.find(params[:id])
      erb :"/cars/show"
    else
      redirect "/login"
    end
  end

  get "/cars/:id/edit" do
    @car = Car.find(params[:id])
    if logged_in?
      if @car.hotwheeler_id == current_user.id
        erb :"/cars/edit"
      else
        redirect "/hotwheelers/#{current_user.id}"
      end
    else
      redirect "/login"
    end
  end

  patch "/cars/:id" do

    @car = Car.find(params[:id])
    if @car.hotwheeler_id == current_user.id
      @car.update(year: params[:year], make: params[:make], model: params[:model], color: params[:color], rank: params[:rank])
      redirect "/cars/#{@car.id}"
    else
      redirect "/login"
    end
  end

  delete "/cars/:id" do
    @car = Car.find(params[:id])
    @car.destroy
    redirect "/hotwheelers"
  end

end
