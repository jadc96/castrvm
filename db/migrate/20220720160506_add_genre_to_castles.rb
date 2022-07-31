class AddGenreTocastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :genre, :string
  end
end
