class AddTrailerKeyToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :trailer_key, :string
  end
end
