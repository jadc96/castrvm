class AddUserToCastles < ActiveRecord::Migration[7.0]
  def change
    add_reference :castles, :user, null: false, foreign_key: true
  end
end
