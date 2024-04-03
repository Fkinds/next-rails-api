class Public::GenresController < ApplicationController
  def index
    genres = Genre.all
    render json: genres
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render status: 200, json: @genre
    else
      render status: 400, json: @genre.errors
    end
  end

  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
