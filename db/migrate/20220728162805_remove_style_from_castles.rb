class RemoveStyleFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :style
  end
end
