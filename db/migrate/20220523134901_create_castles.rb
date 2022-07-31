class CreateCastles < ActiveRecord::Migration[7.0]
  def change
    create_table :castles do |t|
      t.string :description
      t.integer :price_per_day

      t.timestamps
    end
  end
end
