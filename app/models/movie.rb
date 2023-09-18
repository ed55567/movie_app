# app/models/movie.rb

class Movie < ApplicationRecord
    paginates_per 20
    # ...
end
  