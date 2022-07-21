class AddDescriptionTocastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :description, :text
  end
end
