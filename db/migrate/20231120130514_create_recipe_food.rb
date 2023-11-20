class CreateRecipeFood < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|

      t.timestamps
    end
  end
end
