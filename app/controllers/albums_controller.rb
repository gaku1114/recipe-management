class AlbumsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @dishes = Dish.where(user_id: current_user.id)
  end
end