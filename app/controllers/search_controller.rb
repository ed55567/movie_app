# app/controllers/search_controller.rb

class SearchController < ApplicationController
    def index
      if params[:query].present?
        @results = Tmdb::Search.movie(params[:query])
        puts @results.inspect # Add this line for debugging
      else
        @results = []
      end
    end
end
  
  