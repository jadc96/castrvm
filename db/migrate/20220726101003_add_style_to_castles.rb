class AddStyleToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :style, :string
  end
end
