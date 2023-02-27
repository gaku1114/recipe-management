class GenresController < ApplicationController
  def index
    @genres = current_user.genres
  end

  def new
    @genre = Genre.new
    session[:previous_url] = request.referer 
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to session[:previous_url]
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])

    unless @genre.user == current_user
      redirect_to dishes_path
    end
    
    session[:previous_url] = request.referer
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to session[:previous_url]
    else
      render :edit
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  
  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end
end
