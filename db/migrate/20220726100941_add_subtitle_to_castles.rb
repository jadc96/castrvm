class AddSubtitleToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :subtitle, :string
  end
end
