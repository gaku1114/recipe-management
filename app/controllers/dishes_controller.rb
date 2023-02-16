class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :genre_index, :show, :genre_show, :search, :search_show]

  def index
    @genres = Genre.where(user_id: current_user.id)
    @dishes = Dish.where(user_id: current_user.id)
  end

  def genre_index
    @genres = Genre.where(user_id: current_user.id)
    @dishes = Dish.where(genre_id: params[:id])
    @genre = Genre.find(params[:id])
  end

  def show
    @genres = Genre.where(user_id: current_user.id)
    @dish = Dish.find(params[:id])

    @materials = Material.where(dish_id: @dish.id)
    @material = Material.new
  end

  def genre_show
    @genres = Genre.where(user_id: current_user.id)
    @dish = Dish.find(params[:id])
    @genre = Genre.find(@dish.genre_id)
    @dishes = Dish.where(genre_id: @genre.id)

    @materials = Material.where(dish_id: @dish.id)
    @material = Material.new
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @dish = Dish.find(params[:id])
    session[:previous_url] = request.referer
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to session[:previous_url]
    else
      render :edit
    end
  end

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy
    redirect_to action: :index
  end

  def search
    @q = current_user.dishes.ransack(params[:q])
    @dishes = @q.result
    @genres = Genre.where(user_id: current_user.id)
  end

  def search_show
    @q = current_user.dishes.ransack(params[:q])
    @dishes = @q.result
    @genres = Genre.where(user_id: current_user.id)
    
    @dish = Dish.find(params[:id])
    @materials = Material.where(dish_id: @dish.id)
    @material = Material.new
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_name, :url, :genre_id).merge(user_id: current_user.id)
  end

  def set_q
    @q = Dish.ransack(params[:q])
  end

end
