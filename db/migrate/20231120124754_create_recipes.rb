class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade, on_update: :cascade}
      t.string :name
      t.decimal :preparation_time
      t.decimal :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
