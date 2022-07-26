class AddIndexedToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :indexed, :boolean
  end
end
