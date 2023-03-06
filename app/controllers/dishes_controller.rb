class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :genre_index, :show, :genre_show, :search, :search_show, :new, :edit]

  def index
    @genres = Genre.where(user_id: current_user.id)
    @dishes = Dish.where(user_id: current_user.id).order(id: "DESC")
  end

  def genre_index
    @genres = Genre.where(user_id: current_user.id)
    @dishes = Dish.where(genre_id: params[:id]).order(id: "DESC")
    @genre = Genre.find(params[:id])
    unless @genre.user == current_user
      redirect_to dishes_path
    end
  end

  def show
    @genres = Genre.where(user_id: current_user.id)
    @dishes = Dish.where(user_id: current_user.id).order(id: "DESC")
    @dish = Dish.find(params[:id])

    unless @dish.user == current_user
      redirect_to dishes_path
    end

    @materials = Material.where(dish_id: @dish.id)
    @material = Material.new

    gon.dish_id = @dish.id
    gon.materials = @materials

    gon.materials_id = []
    gon.materials_name = []

    @materials.each_with_index do |material,i|
      gon.materials_id[i] = material.id
      gon.materials_name[i] = material.name
    end
  end

  def genre_show
    @genres = Genre.where(user_id: current_user.id)
    @dish = Dish.find(params[:id])
    @genre = Genre.find(@dish.genre_id)
    @dishes = Dish.where(genre_id: @genre.id).order(id: "DESC")

    unless @dish.user == current_user
      redirect_to dishes_path
    end

    @materials = Material.where(dish_id: @dish.id)
    @material = Material.new

    gon.dish_id = @dish.id
    gon.materials = @materials

    gon.materials_id = []
    gon.materials_name = []

    @materials.each_with_index do |material,i|
      gon.materials_id[i] = material.id
      gon.materials_name[i] = material.name
    end
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
    unless @dish.user == current_user
      redirect_to dishes_path
    end
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
    @dishes = @q.result.order(id: "DESC")
    @genres = Genre.where(user_id: current_user.id)
  end

  def search_show
    @q = current_user.dishes.ransack(params[:q])
    @dishes = @q.result.order(id: "DESC")
    @genres = Genre.where(user_id: current_user.id)

    @dish = Dish.find(params[:id])
    @materials = Material.where(dish_id: @dish.id)
    @material = Material.new

    unless @dish.user == current_user
      redirect_to dishes_path
    end

    gon.dish_id = @dish.id
    gon.materials = @materials

    gon.materials_id = []
    gon.materials_name = []

    @materials.each_with_index do |material,i|
      gon.materials_id[i] = material.id
      gon.materials_name[i] = material.name
    end
  end

  def detail
    @dish = Dish.find(params[:id])
    unless @dish.user == current_user
      redirect_to dishes_path
    end
    @cooks = Cook.where(dish_id: @dish.id)
    @cook = @cooks.maximum(:cook_date)
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_name, :url, :genre_id, :image).merge(user_id: current_user.id)
  end

  def set_q
    @q = Dish.ransack(params[:q])
  end

end
