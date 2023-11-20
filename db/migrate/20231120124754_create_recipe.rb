class CreateRecipe < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|

      t.timestamps
    end
  end
end
