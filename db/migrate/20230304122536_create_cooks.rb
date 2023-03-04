class CreateCooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cooks do |t|
      t.date       :cook_date,  null: false
      t.references :dish,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
