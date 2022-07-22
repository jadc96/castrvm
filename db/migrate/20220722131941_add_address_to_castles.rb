class AddAddressToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :address, :string
  end
end
