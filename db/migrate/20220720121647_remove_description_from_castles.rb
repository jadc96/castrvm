class RemoveDescriptionFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :description
  end
end
