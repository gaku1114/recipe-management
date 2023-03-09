class CooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @cook = Cook.new
    @dish = Dish.find(params[:dish_id])
    unless @dish.user == current_user
      redirect_to dishes_path
    end
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      redirect_to detail_dish_path(params[:dish_id])
    else
      redirect_to action: :new
    end
  end

  def destroy
    cook = Cook.find(params[:id])
    cook.destroy
    redirect_back(fallback_location: dishes_path)
  end

  private
  def cook_params
    params.require(:cook).permit(:cook_date).merge(dish_id: params[:dish_id])
  end
end
