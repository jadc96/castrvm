class AddNameToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :name, :string
  end
end
