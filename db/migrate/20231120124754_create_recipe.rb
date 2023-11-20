class CreateRecipe < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.reference :user, null: false, foreign_key: true
      t.string :name
      t.time :preparation_time
      t.time :cooking_time
      t.text :description
      t.bool :public
      t.timestamps
    end
  end
end
