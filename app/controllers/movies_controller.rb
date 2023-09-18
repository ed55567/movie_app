# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
    def index
      @movies = Tmdb::Movie.popular
    end
    def show
        @movie = Tmdb::Movie.detail(params[:id])
        @movie.trailer_key = fetch_movie_trailer(params[:id])
        @movie.actors = fetch_movie_actors(params[:id])
        @movie.box_office = fetch_movie_box_office(params[:id])
    end
    
      private
    
    def fetch_movie_trailer(movie_id)
        videos = Tmdb::Movie.videos(movie_id)
        trailer = videos.find { |video| video['type'] == 'Trailer' }
        trailer['key'] if trailer
    end
    
    def fetch_movie_actors(movie_id)
        cast = Tmdb::Movie.cast(movie_id)
        cast.map { |actor| actor['name'] }.join(', ')
    end
    
    def fetch_movie_box_office(movie_id)
        movie_details = Tmdb::Movie.detail(movie_id)
        budget = movie_details['budget']
        revenue = movie_details['revenue']
      
        "Budget: $#{budget.to_i / 1000000}M, Revenue: $#{revenue.to_i / 1000000}M"
    end
      
end
  