class RemoveCityFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :city
  end
end
