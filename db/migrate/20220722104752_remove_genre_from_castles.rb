class RemoveGenreFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :genre
  end
end
