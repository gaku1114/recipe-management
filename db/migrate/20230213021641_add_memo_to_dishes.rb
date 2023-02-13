class AddMemoToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :memo, :text
  end
end
