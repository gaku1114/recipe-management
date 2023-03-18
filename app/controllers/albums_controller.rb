class AlbumsController < ApplicationController
  def index
    @dishes = Dish.where(user_id: current_user.id)
  end
end