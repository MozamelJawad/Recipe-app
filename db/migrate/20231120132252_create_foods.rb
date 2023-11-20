class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }, null: false
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
