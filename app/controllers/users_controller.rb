class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dishes = Dish.where(user_id: @user.id)
    @genre_ranks = @user.genres.find(@user.dishes.group(:genre_id).order('count(genre_id) desc').pluck(:genre_id))
    binding.pry
  end
end
