class CooksController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @cook = Cook.new
    session[:previous_url] = request.referer 
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      redirect_to session[:previous_url]
    else
      render :new
    end
  end

  private
  def cook_params
    params.require(:cook).permit(:cook_date).merge(dish_id: params[:dish_id])
  end
end
