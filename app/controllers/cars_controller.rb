class CarsController < ApplicationController

  # GET: /cars
  get "/cars" do
    @cars = Car.all
    # binding.pry
    erb :"/cars/index"
  end

  # GET: /cars/new
  get "/cars/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :"/cars/new"
    end

  end

  # POST: /cars
  post "/cars" do
    if !logged_in?
      redirect "/login"
    else
      @car = Car.create(year: params[:year], make: params[:make], model: params[:model], color: params[:color], rank: params[:rank], hotwheeler_id: current_user.id)
      redirect "/cars/#{@car.id}"
    end
  end

  # GET: /cars/5
  get "/cars/:id" do
    @car = Car.find(params[:id])
    erb :"/cars/show"
  end

  get "/cars/:id/edit" do
    @car = Car.find(params[:id])

    erb :"/cars/edit"
  end

  patch "/cars/:id" do

    @car = Car.find(params[:id])

    @car.update(year: params[:year], make: params[:make], model: params[:model], color: params[:color], rank: params[:rank])
    redirect "/cars/#{@car.id}"
  end

  delete "/cars/:id" do
    @car = Car.find(params[:id])
    @car.destroy
    redirect "/cars"
  end

end
