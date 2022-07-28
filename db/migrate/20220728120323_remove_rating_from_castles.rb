class RemoveRatingFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :rating
  end
end
