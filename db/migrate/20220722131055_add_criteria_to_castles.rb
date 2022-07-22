class AddCriteriaToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :favorite, :boolean
    add_column :castles, :number_of_room, :integer
    add_column :castles, :number_of_bed, :integer
    add_column :castles, :smokers_welcome, :boolean
    add_column :castles, :animals_welcome, :boolean
    add_column :castles, :wifi, :boolean
    add_column :castles, :review, :text
    add_column :castles, :rating, :integer
  end
end
