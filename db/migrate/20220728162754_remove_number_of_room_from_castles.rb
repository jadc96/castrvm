class RemoveNumberOfRoomFromCastles < ActiveRecord::Migration[7.0]
  def change
    remove_column :castles, :number_of_room
  end
end
