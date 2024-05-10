class CreateGuitars < ActiveRecord::Migration[7.1]
  def change
    create_table :guitars do |t|
      t.string :name
      t.boolean :used
      t.integer :price
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
