class MoviesController < ApplicationController

  def index
    if Movie.search(params[:search])
      @movies = Movie.search(params[:search])
    elsif params[:duration] == 1.to_s
      @movies = Movie.duratin_under_90(params[:duration]) 
    elsif params[:duration] == 2.to_s
      @movies = Movie.duratin_above_90_under_120(params[:duration]) 
    elsif params[:duration] == 3.to_s
      @movies =Movie.duratin_above_90(params[:duration]) 
    else 
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :description, :search
    )
  end

end