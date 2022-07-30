class AddReferenceToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :reference, :string
  end
end
