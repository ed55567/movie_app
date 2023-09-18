class AddActorsAndBoxOfficeToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :actors, :text
    add_column :movies, :box_office, :string
  end
end
