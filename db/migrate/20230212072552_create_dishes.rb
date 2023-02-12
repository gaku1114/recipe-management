class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :dish_name,  null: false
      t.string :url,        null: false
      t.references :user,   null: false, foreing_key: true
      t.references :genre,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
