class RemoveFavoriteFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :favorite, :boolean
  end
end
