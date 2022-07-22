class AddDepartmentToCastles < ActiveRecord::Migration[7.0]
  def change
    add_column :castles, :department, :string
  end
end
