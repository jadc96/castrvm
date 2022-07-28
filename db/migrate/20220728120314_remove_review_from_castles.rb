class RemoveReviewFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :review
  end
end
