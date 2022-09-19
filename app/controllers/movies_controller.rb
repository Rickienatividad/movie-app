class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies.as_json
  end

  def show
    movie = Movie.find_by(id: params["id"])
    render json: movie.as_json
  end

  def take_two
    movie = Movie.take(2)
    render json: movie.as_json
  end

  def create
    movie = Movie.new(
      title: params["title"],
      plot: params["plot"],
      year: params["year"],
    )
    if movie.save
      render json: movie.as_json
    else
      render json: { errors: movie.errors.full_messages }
    end
  end

  def update
    movie = Movie.find_by(id: params["id"])
    movie.title = params["title"] || movie.title
    movie.plot = params["plot"] || movie.plot
    movie.year = params["year"] || movie.year
    
    if movie.save
      render json: movie.as_json
    else  
      render json: {errors: movie.errors.full_messages}
    end
  end

  def destroy
    movie = Movie.find_by(id: params["id"])
    movie.destroy

    render json: {message: "movie removed"}
  end
end
