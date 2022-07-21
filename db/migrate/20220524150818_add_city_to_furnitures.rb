class AddCityTocastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :city, :string
  end
end
