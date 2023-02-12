class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name,      null: false
      t.references :dish,  null: false, foreign_key: true 
      t.timestamps
    end
  end
end
