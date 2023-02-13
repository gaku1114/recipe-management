class DishesController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.where(user_id: current_user.id)
    @dishes = Dish.where(user_id: current_user.id)
    if params[:id].present?
      @genre = Genre.find(params[:id])
      @dishes = Dish.where(genre_id: params[:id])
    end

    if params[:dish_id].present?
      @dish = Dish.find(params[:dish_id])
    end
  end

  def new
    @dish = Dish.new
  end
    

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy
    redirect_to root_path
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_name, :url, :genre_id).merge(user_id: current_user.id)
  end

end
